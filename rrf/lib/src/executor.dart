import 'package:rrf/rrf.dart';

abstract interface class Executor {
  Future<Response<TResult>> execute<TResult>(Request<TResult> request);
  void send(Event event);
}

abstract interface class SessionExecutor implements Executor {
  bool get isRunning;
  Future<void> start();
  Future<void> end();
}

extension ExecutorExtension on Executor {
  Future<T> executeAndGetValue<T>(Request<T> request) async {
    final response = await execute(request);
    switch (response) {
      case SuccessResponse<T> ok:
        return ok.value;
      case FailureResponse<T> notOk:
        throw notOk.error;
    }
  }
}
