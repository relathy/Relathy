import 'package:uuid/uuid.dart';

class UuidService {
  static const _uuid = Uuid();

  static String generate() => _uuid.v4();
}
