import 'package:meta/meta.dart';
import 'package:relathy_shared/domain_layer/core_module/data/aggregates/aggregate.dart';
import 'package:relathy_shared/domain_layer/core_module/data/object.dart';

@immutable
class ObjectIsInstanceOf implements Aggregate {
  final ObjectId objectId;
  final ObjectId type;
  final List<ObjectId> typeExtends;

  ObjectIsInstanceOf({required this.objectId, required this.type, required this.typeExtends});

  bool isInstanceOf(ObjectId $class) => type == $class || typeExtends.contains($class);

  Iterable<ObjectId> iterateClasses() sync* {
    yield* [type];
    yield* typeExtends;
  }

  @override
  String toString() {
    return iterateClasses().map((x) => x.value).reduce((x1, x2) => "$x1, $x2");
  }
}
