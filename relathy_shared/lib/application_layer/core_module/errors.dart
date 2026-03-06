import 'package:rrf/rrf.dart';
import 'package:relathy_shared/domain_layer/core_module/data/object.dart';

abstract class Errors {
  static DataNotFoundException objectNotFound(ObjectId id) =>
      DataNotFoundException(dataId: id.toString(), dataType: "object");
}
