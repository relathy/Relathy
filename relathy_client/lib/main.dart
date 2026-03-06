import 'package:flutter/material.dart';
import 'package:relathy_client/composition_root.dart';
import 'package:window_manager/window_manager.dart';
import 'package:intl/date_symbol_data_local.dart';

/*
TODOS:
 - add a modelId field on meta objects (class, etc). This will help to load all meta objects from a given model. 
 
ISSUES:
 - in session impl, objectdata depend on aggregates, aggregates depend on session. this means objectdata depend on session. 
 this means we have a problem when u take an objectdata from another active session.
 
 - display name shows only the sync status, not the other categories and phases

*/
void main() async {
  await initializeDateFormatting();
  WidgetsFlutterBinding.ensureInitialized();

  await windowManager.ensureInitialized();
  await windowManager.setTitle("Web of Objects");
  WindowOptions windowOptions = const WindowOptions(minimumSize: Size(650, 500));

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  final compositionRoot = FrontendCompositionRoot(isLocal: true);
  final appClient = compositionRoot.getAppClient();
  await appClient.start();
  var appWidget = compositionRoot.createAppView();
  runApp(appWidget);
}
