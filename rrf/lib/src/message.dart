import 'package:meta/meta.dart';
import 'package:rrf/rrf.dart';

abstract interface class RequestVisitor {
  void visit<TRequest extends Request<TResult>, TResult>(TRequest request);
}

abstract interface class EventVisitor {
  void visit<TEvent extends Event>(TEvent event);
}

@immutable
abstract class Message {
  Map<String, dynamic> toJson();

  late final String type = runtimeType.toString();
}

@immutable
abstract class Request<T> extends Message {
  Type getResultType() => T;

  void acceptVisitor(RequestVisitor visitor);
}

@immutable
abstract class Query<T> extends Request<T> {}

@immutable
abstract class Command<T> extends Request<T> {}

@immutable
abstract class Event extends Message {
  void acceptVisitor(EventVisitor visitor);
}

abstract interface class MessageWithContext<TContext> {
  TContext get context;
}

@immutable
abstract class EventWithContext<TContext> extends Event implements MessageWithContext<TContext> {
  @override
  final TContext context;

  EventWithContext({required this.context});
}

@immutable
abstract class QueryWithContext<T, TContext> extends Query<T> implements MessageWithContext<TContext> {
  @override
  final TContext context;

  QueryWithContext({required this.context});
}

@immutable
abstract class CommandWithContext<T, TContext> extends Command<T> implements MessageWithContext<TContext> {
  @override
  final TContext context;

  CommandWithContext({required this.context});
}

enum ResponseStatus { ok, failure }

sealed class Response<T> {
  static final Future<Response<void>> okVoidFuture = okFuture<void>(null);

  static final Response<void> okVoid = SuccessResponse<void>(null);

  static Future<Response<T>> okFuture<T>(T value) => Future.value(SuccessResponse(value));

  const Response();

  factory Response.success(T value) => SuccessResponse(value);

  factory Response.failure(AppError error) => FailureResponse(error);
  ResponseStatus get status {
    switch (this) {
      case SuccessResponse<T>():
        return ResponseStatus.ok;
      case FailureResponse<T>():
        return ResponseStatus.failure;
    }
  }

  bool get isSuccess => this is SuccessResponse<T>;
  bool get isFailure => this is FailureResponse<T>;

  T getValue() {
    switch (this) {
      case FailureResponse<T> failure:
        throw failure.error;
      case SuccessResponse<T> success:
        return success.value;
    }
  }

  AppError getError() {
    return (this as FailureResponse<T>).error;
  }
}

final class SuccessResponse<T> extends Response<T> {
  const SuccessResponse(this.value);

  final T value;
}

final class FailureResponse<T> extends Response<T> {
  const FailureResponse(this.error);
  factory FailureResponse.validationClientError(String message) =>
      FailureResponse(ValidationClientError(message));
  final AppError error;
}
