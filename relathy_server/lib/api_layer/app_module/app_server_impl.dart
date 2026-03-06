import 'package:rrf/rrf.dart';
import 'package:rrf/rrf_json.dart';
import 'package:relathy_server/application_layer/app_module/app_server.dart';
import 'package:rrf_server_web_sockets/web_socket_server.dart';

class WebSocketAppServer implements AppServer {
  final AppServer appServer;
  late final WebSocketServer _server;

  WebSocketAppServer(
    this.appServer,
    MessageDtoJsonConverter jsonConverter, {
    required String address,
    required int port,
  }) : _server = WebSocketServer(jsonConverter, appServer, address: address, port: port);

  @override
  bool get isRunning => _server.isRunning;

  @override
  Future<void> start() async {
    await appServer.start();
    await _server.start();
  }

  @override
  Future<void> end() async {
    await appServer.end();
    await _server.end();
  }

  @override
  Future<Response<TResult>> execute<TResult>(Request<TResult> request) {
    return appServer.execute(request);
  }

  @override
  void send(Event event) {
    appServer.send(event);
  }
}
