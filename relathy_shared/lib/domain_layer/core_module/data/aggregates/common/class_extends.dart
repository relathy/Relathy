import 'package:meta/meta.dart';
import 'package:relathy_shared/domain_layer/core_module/data/aggregates/aggregate.dart';
import 'package:relathy_shared/domain_layer/core_module/data/object.dart';

@immutable
class ClassExtends implements Aggregate {
  final List<ObjectId> classes;

  ClassExtends({required this.classes});

  bool $extends(ObjectId $class) => classes.contains($class);

  @override
  String toString() {
    return classes.map((x) => x.value).reduce((x1, x2) => "$x1, $x2");
  }
}
