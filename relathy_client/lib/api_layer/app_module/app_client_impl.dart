import 'package:relathy_server/application_layer/app_module/app_server.dart';
import 'package:relathy_server/composition_root.dart';
import 'package:rrf/rrf_json.dart';
import 'package:relathy_client/application_layer/app_module/app_client.dart';
import 'package:rrf_client_web_sockets/rrf_client_web_sockets.dart';
import 'package:rrf/rrf.dart';

class WebSocketAppClient implements AppClient {
  late final WebSocketClient _client;

  WebSocketAppClient(Uri uri, MessageDtoJsonConverter jsonConverter)
    : _client = WebSocketClient(uri, jsonConverter);

  @override
  Future<Response<TResult>> execute<TResult>(Request<TResult> request) => _client.execute(request);

  @override
  bool get isRunning => _client.isRunning;

  @override
  Future<void> start() => _client.start();
  @override
  Future<void> end() => _client.end();

  @override
  void send(Event event) => _client.send(event);
}

class LocalAppClientImpl implements AppClient {
  late final AppServer server;
  LocalAppClientImpl(MessageDtoJsonConverter jsonConverter) {
    final compositionRoot = BackendCompositionRoot();
    server = compositionRoot.getAppServer();
  }

  @override
  Future<Response<TResult>> execute<TResult>(Request<TResult> request) => server.execute(request);

  @override
  bool get isRunning => server.isRunning;

  @override
  Future<void> start() => server.start();

  @override
  Future<void> end() async => server.end();

  @override
  void send(Event event) => server.send(event);
}
