import 'package:dart_dependency_injection/dart_dependency_injection.dart';
import 'package:relathy_server/api_layer/app_module/app_server_impl.dart';
import 'package:relathy_server/application_layer/app_module/app_server.dart';
import 'package:relathy_server/application_layer/app_module/repositories/application_info_repository.dart';
import 'package:relathy_server/application_layer/app_module/app_server_impl.dart';
import 'package:relathy_server/application_layer/app_module/use_cases/app_initializer.dart';
import 'package:relathy_server/persistence_layer_in_memory/app_module/application_info_repository_impl.dart';
import 'package:relathy_shared/application_layer/app_module/app_json_converter_factory.dart';
import 'package:rrf/rrf_server.dart';
import 'package:rrf/rrf_server_impl.dart';
import 'package:rrf/rrf.dart';

void _registerTypes(ServiceCollection services) {
  _addHandlers(services);
  services.addSingleton<DateTimeService>((s) => DateTimeServiceImpl());
  services.addSingleton<MessageScopeFactory>((s) => _MessageScopeFactoryImpl(s));
  services.addSingleton((s) => AppJsonConverterFactory.create());
  services.addSingleton<ApplicationInfoRepository>((s) => InMemoryApplicationInfoRepositoryImpl());

  services.add<AppInitializer>((s) => AppInitializer(s.get()));
  services.addSingleton<AppServer>((s) => AppServerImpl(s.get(), s.get()));
  services.addSingleton<Executor>((s) => s.get<AppServer>());
  services.addSingleton<WebSocketAppServer>(
    (s) => WebSocketAppServer(s.get(), s.get(), address: 'localhost', port: 5000),
  );
  services.add<List<MiddlewareExecutor>>((s) => List.unmodifiable([]));
}

void _addHandlers(ServiceCollection services) {}

class BackendCompositionRoot {
  late final ServiceProvider _serviceProvider;
  BackendCompositionRoot() {
    final services = ServiceCollection();
    _registerTypes(services);
    _serviceProvider = services.build();
  }

  AppServer getAppServer() {
    return _serviceProvider.get<AppServer>();
  }

  WebSocketAppServer getWebSocketAppServer() {
    return _serviceProvider.get<WebSocketAppServer>();
  }
}

class _MessageScopeFactoryImpl implements MessageScopeFactory {
  final ServiceProvider _serviceProvider;

  _MessageScopeFactoryImpl(this._serviceProvider);

  @override
  MessageScope<TMessage> create<TMessage extends Message>(TMessage message) {
    return _MessageScope<TMessage>(message, _serviceProvider.buildScoped());
  }
}

class _MessageScope<TMessage extends Message> implements MessageScope<TMessage> {
  @override
  late final List<MiddlewareExecutor> middlewareExecutors;

  @override
  final TMessage message;

  @override
  late final Handler<TMessage> handler;

  final ServiceProvider _serviceProvider;

  _MessageScope(this.message, this._serviceProvider) {
    handler = _serviceProvider.get<Handler<TMessage>>();
    middlewareExecutors = _serviceProvider.get<List<MiddlewareExecutor>>();
  }

  @override
  void dispose() {
    _serviceProvider.dispose();
  }
}
