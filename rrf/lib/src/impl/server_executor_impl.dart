import 'package:rrf/src/middleware_executor.dart';
import 'package:rrf/src/handler.dart';
import 'package:rrf/rrf.dart';

abstract interface class MessageScope<TMessage extends Message> {
  TMessage get message;

  Handler<TMessage> get handler;

  List<MiddlewareExecutor> get middlewareExecutors;

  void dispose();
}

abstract interface class MessageScopeFactory {
  MessageScope<TMessage> create<TMessage extends Message>(TMessage message);
}

class ExecutorImpl implements Executor {
  final MessageScopeFactory _messageScopeFactory;
  final List<Type> _orderedMiddlewareExecutorTypes;
  ExecutorImpl(this._messageScopeFactory, this._orderedMiddlewareExecutorTypes);

  @override
  Future<Response<T>> execute<T>(Request<T> request) async {
    final visitor = _RequestVisitor(_messageScopeFactory, _orderedMiddlewareExecutorTypes);
    request.acceptVisitor(visitor);
    final result = await visitor.response;
    return result as Response<T>;
  }

  @override
  void send(Event event) {
    final visitor = _EventVisitor(_messageScopeFactory, _orderedMiddlewareExecutorTypes);
    event.acceptVisitor(visitor);
  }
}

class _EventVisitor implements EventVisitor {
  late final Future<void> response;
  final List<Type> _middlewareExecutorTypes;
  final MessageScopeFactory _messageScopeFactory;

  _EventVisitor(this._messageScopeFactory, this._middlewareExecutorTypes);

  @override
  void visit<TEvent extends Event>(TEvent event) {
    response = _handleEvent<TEvent>(event);
  }

  Future<void> _handleEvent<TEvent extends Event>(TEvent event) async {
    final scope = _messageScopeFactory.create<TEvent>(event);

    try {
      final handler = scope.handler;
      MiddlewareNextSend<TEvent> currentSend = (handler as EventHandler<TEvent>).handle;
      final middlewareExecutors = _listOrderedMiddlewareExecutors(scope, _middlewareExecutorTypes);

      for (final middlewareExecutor in middlewareExecutors.reversed) {
        final next = currentSend;
        currentSend = (e) => middlewareExecutor.send(e, next);
      }

      await currentSend(event);
    } finally {
      scope.dispose();
    }
  }
}

class _RequestVisitor implements RequestVisitor {
  late final Future<Response> response;
  final List<Type> _middlewareExecutorTypes;
  final MessageScopeFactory _messageScopeFactory;

  _RequestVisitor(this._messageScopeFactory, this._middlewareExecutorTypes);

  @override
  void visit<TRequest extends Request<TResult>, TResult>(TRequest request) {
    response = _handleRequest<TRequest, TResult>(request);
  }

  Future<Response<TResult>> _handleRequest<TRequest extends Request<TResult>, TResult>(
    TRequest request,
  ) async {
    final scope = _messageScopeFactory.create<TRequest>(request);

    try {
      final handler = scope.handler;
      MiddlewareNextExecute<TRequest, TResult> currentExecute =
          (handler as RequestHandler<TRequest, TResult>).handle;
      final middlewareExecutors = _listOrderedMiddlewareExecutors(scope, _middlewareExecutorTypes);

      for (final middlewareExecutor in middlewareExecutors.reversed) {
        final next = currentExecute;
        currentExecute = (r) => middlewareExecutor.execute(r, next);
      }

      final response = await currentExecute(request);
      return response;
    } finally {
      scope.dispose();
    }
  }
}

List<MiddlewareExecutor> _listOrderedMiddlewareExecutors<TMessage extends Message>(
  MessageScope<TMessage> scope,
  List<Type> middlewareExecutorTypes,
) {
  final middlewareExecutorsByType = {for (final x in scope.middlewareExecutors) x.runtimeType: x};
  final middlewareExecutors = middlewareExecutorTypes.map((x) => middlewareExecutorsByType[x]!).toList();
  return middlewareExecutors;
}
