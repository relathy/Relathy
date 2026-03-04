import 'package:rrf/rrf.dart';

abstract interface class Handler<TMessage extends Message> {}

abstract class RequestHandler<TRequest extends Request<TResult>, TResult> implements Handler<TRequest> {
  Future<Response<TResult>> handle(TRequest request);
}

abstract class EventHandler<TEvent extends Event> implements Handler<TEvent> {
  Future<void> handle(TEvent event);
}

abstract class QueryHandler<TQuery extends Query<TResult>, TResult> extends RequestHandler<TQuery, TResult> {}

abstract class CommandHandler<TCommand extends Command<TResult>, TResult>
    extends RequestHandler<TCommand, TResult> {}
