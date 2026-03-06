import 'package:relathy_server/application_layer/app_module/app_server.dart';
import 'package:relathy_server/composition_root.dart';
import 'package:rrf/rrf_json.dart';
import 'package:relathy_client/application_layer/app_module/app_client.dart';
import 'package:rrf/rrf.dart';

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
