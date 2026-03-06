import 'package:relathy_server/composition_root.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  await initializeDateFormatting();
  final compositionRoot = BackendCompositionRoot();
  final appServer = compositionRoot.getWebSocketAppServer();
  await appServer.start();
}
