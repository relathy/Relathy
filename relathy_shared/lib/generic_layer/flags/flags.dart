abstract class Flags {
  static const bool isDebug = bool.fromEnvironment('dart.vm.product') == false;
}
