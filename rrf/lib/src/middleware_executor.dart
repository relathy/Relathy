import 'package:rrf/rrf.dart';

typedef MiddlewareNextExecute<TRequest extends Request<TResult>, TResult> =
    Future<Response<TResult>> Function(TRequest request);

typedef MiddlewareNextSend<TEvent extends Event> = Future<void> Function(TEvent event);

abstract interface class MiddlewareExecutor {
  Future<Response<TResult>> execute<TRequest extends Request<TResult>, TResult>(
    TRequest request,
    MiddlewareNextExecute<TRequest, TResult> nextExecute,
  );

  Future<void> send<TEvent extends Event>(TEvent event, MiddlewareNextSend<TEvent> nextSend);
}
