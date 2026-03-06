import 'package:rrf/rrf.dart';

abstract interface class AppClient implements Executor {
  bool get isRunning;
  Future<void> start();
  Future<void> end();
}
