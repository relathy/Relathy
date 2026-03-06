import 'package:relathy_server/application_layer/app_module/app_server.dart';
import 'package:relathy_server/application_layer/app_module/use_cases/app_initializer.dart';
import 'package:rrf/rrf_server_impl.dart';
import 'package:rrf/rrf.dart';

class AppServerImpl implements AppServer {
  final AppInitializer _appInitializer;
  final Executor _internalExecutor;
  static final List<Type> orderedMiddlewareExecutorTypes = [];

  bool _isRunning = false;
  bool _isStarted = false;
  bool _isDisposed = false;

  @override
  bool get isRunning => _isRunning;

  AppServerImpl(this._appInitializer, MessageScopeFactory messageScopeFactory)
    : _internalExecutor = ExecutorImpl(messageScopeFactory, orderedMiddlewareExecutorTypes);

  @override
  Future<void> start() async {
    if (_isDisposed) {
      throw StateError("is disposed");
    }

    if (_isStarted) {
      throw StateError("was already started");
    }
    _isStarted = true;
    await _appInitializer.init();
    _isRunning = true;
  }

  @override
  Future<Response<T>> execute<T>(Request<T> message) {
    if (_isDisposed) {
      throw StateError("is disposed");
    }

    if (!_isRunning) {
      throw StateError("should be running");
    }

    return _internalExecutor.execute<T>(message);
  }

  @override
  void send(Event event) {
    if (_isDisposed) {
      throw StateError("is disposed");
    }

    if (!_isRunning) {
      throw StateError("should be running");
    }

    _internalExecutor.send(event);
  }

  @override
  Future<void> end() async {
    if (_isDisposed) return;
    _isDisposed = true;
  }
}
