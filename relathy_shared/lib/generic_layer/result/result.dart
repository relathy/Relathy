import 'package:rrf/rrf.dart';
import 'package:relathy_shared/generic_layer/result/result.dart';
import 'package:mobx/mobx.dart';

enum AsyncResultStatus { success, error, pending }

extension FutureExtension<T> on Future<T> {
  Future<T> setAsyncResult(Function(AsyncResult<T>) action) {
    action(AsyncPending<T>());
    return then((value) {
      action(AsyncSuccess<T>(value));
      return value;
    }).catchError((error, stackTrace) {
      action(AsyncFailure<T>(error));
      throw error;
    });
  }
}

typedef FutureAsyncResult<T> = Future<AsyncResult<T>>;

typedef FutureAsyncVoid = Future<AsyncResult<void>>;

typedef AsyncVoid = AsyncResult<void>;

sealed class AsyncResult<T> {
  const AsyncResult();
  factory AsyncResult.pending() => AsyncPending();
  factory AsyncResult.success(T result) => AsyncSuccess(result);
  factory AsyncResult.failure(Object error) => AsyncFailure(error);

  bool get isSuccess => this is AsyncSuccess<T>;
  bool get isFailure => this is AsyncFailure<T>;
  bool get isPending => this is AsyncPending<T>;

  String getFriendlyErrorMessage() {
    var error = getError();
    return error is AppError ? error.toFriendlyString() : "Internal error";
  }

  AsyncResultStatus get status {
    switch (this) {
      case AsyncPending<T>():
        return AsyncResultStatus.pending;
      case AsyncSuccess<T>():
        return AsyncResultStatus.success;
      case AsyncFailure<T>():
        return AsyncResultStatus.error;
    }
  }

  T? getValueOrOtherwiseNull() {
    switch (this) {
      case AsyncFailure<T> _:
        return null;
      case AsyncSuccess<T> ok:
        return ok.value;
      case AsyncPending<T> _:
        return null;
    }
  }

  T getValue() {
    switch (this) {
      case AsyncFailure<T> notOk:
        throw notOk.error;
      case AsyncSuccess<T> ok:
        return ok.value;
      case AsyncPending<T> _:
        throw StateError("pending");
    }
  }

  Object getError() {
    return (this as AsyncFailure<T>).error;
  }

  AsyncResult<M> map<M>(M Function(T t) mapFunction) {
    if (returnIsRequired) {
      return returnRequired();
    }
    return AsyncSuccess(mapFunction(getValue()));
  }
}

final class AsyncPending<T> extends AsyncResult<T> {
  const AsyncPending();
}

final class AsyncSuccess<T> extends AsyncResult<T> {
  const AsyncSuccess(this.value);

  final T value;
}

final class AsyncFailure<T> extends AsyncResult<T> {
  const AsyncFailure(this.error);
  AsyncFailure.validationClientError(String message) : this(ValidationClientError(message));

  final Object error;
}

extension AsyncResultExtension<T> on AsyncResult<T> {
  bool get returnIsRequired => isPending || isFailure;

  AsyncResult<TNext> returnRequired<TNext>() {
    switch (status) {
      case AsyncResultStatus.success:
        throw StateError("success not allowed");
      case AsyncResultStatus.error:
        return AsyncFailure(getError());
      case AsyncResultStatus.pending:
        return AsyncPending();
    }
  }

  Response<TNext> serverReturnRequired<TNext>() {
    switch (status) {
      case AsyncResultStatus.success:
        throw StateError("success not allowed");
      case AsyncResultStatus.error:
        {
          var error = getError();
          if (error is AppError) {
            return FailureResponse(error);
          }
          return FailureResponse(InternalServerError(systemError: error));
        }

      case AsyncResultStatus.pending:
        throw StateError("pending not allowed");
    }
  }
}

extension ListAsyncResultExtension<T> on List<AsyncResult<T>> {
  bool get returnIsRequired => any((x) => x.returnIsRequired);

  AsyncResult<TNext> returnRequired<TNext>() {
    return firstWhere((x) => x.returnIsRequired).returnRequired<TNext>();
  }

  Response<TNext> serverReturnRequired<TNext>() {
    return firstWhere((x) => x.returnIsRequired).serverReturnRequired<TNext>();
  }

  List<T> listValues() {
    return map((x) => x.getValue()).toList();
  }
}

class ComputedAsyncResult<T> {
  final Computed<AsyncResult<T>> _computedResult;

  AsyncResult<T> compute() => _computedResult.value;
  T computeValue() => compute().getValue();
  ComputedAsyncResult(AsyncResult<T> Function() computeResult, {bool? keepAlive})
    : _computedResult = Computed<AsyncResult<T>>(computeResult, keepAlive: keepAlive);

  ComputedAsyncResult<M> map<M>(M Function(T t) mapFunction, {bool? keepAlive}) {
    return ComputedAsyncResult(() {
      var result = compute();
      if (result.returnIsRequired) return result.returnRequired();
      return AsyncSuccess(mapFunction(result.getValue()));
    }, keepAlive: keepAlive);
  }
}

class ComputedResult<T> {
  final Computed<T> _computedResult;

  T compute() => _computedResult.value;
  ComputedResult(T Function() computeResult, {bool? keepAlive})
    : _computedResult = Computed<T>(computeResult, keepAlive: keepAlive);
}

extension ResultExtensions<T> on AsyncResult<T> Function() {
  ComputedAsyncResult<T> toComputedResult({bool? keepAlive}) =>
      ComputedAsyncResult(this, keepAlive: keepAlive);
}

extension ExecutorExtension on Executor {
  FutureAsyncResult<T> executeToAsyncResult<T>(Request<T> message) async {
    final response = await execute(message);
    switch (response) {
      case SuccessResponse<T> ok:
        return AsyncSuccess(ok.value);
      case FailureResponse<T> notOk:
        return AsyncFailure(notOk.error);
    }
  }
}
