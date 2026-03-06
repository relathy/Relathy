import 'package:meta/meta.dart';
import 'package:relathy_shared/domain_layer/core_module/data/aggregates/common/display_name.dart';
import 'package:relathy_shared/domain_layer/core_module/data/aggregates/aggregate.dart';

@immutable
class ObjectPath implements Aggregate {
  final List<ObjectPathItem> items;

  ObjectPath({required this.items});

  static final ObjectPath empty = ObjectPath(items: const []);
}

enum ObjectPathItemType { root, direct }

@immutable
class ObjectPathItem implements Aggregate {
  final DisplayName displayName;
  final ObjectPathItemType pathItemType;

  ObjectPathItem({required this.displayName, required this.pathItemType});
}
