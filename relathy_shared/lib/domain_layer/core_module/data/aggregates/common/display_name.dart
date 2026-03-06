import 'package:meta/meta.dart';
import 'package:relathy_shared/domain_layer/core_module/data/aggregates/aggregate.dart';
import 'package:relathy_shared/domain_layer/core_module/data/object.dart';

enum DisplayNameKind {
  individual,
  type,
  role,
  category,
  valueType,
  phase,
  attributeType,
  typeAttributeType,
  categoryAttributeType,
  phaseAttributeType,
  partOfLabelAttributeType,
  contentAttributeType,
  associationRelationshipType,
  ownerRelationshipType,
  ownedRelationshipType,
}

@immutable
class DisplayName implements Aggregate {
  ObjectId get objectId => object.objectId;

  const DisplayName({
    required this.object,
    required this.instanceName,
    required this.typeName,
    required this.metaName,
    required this.kind,
  });

  final WebObject object;
  final String instanceName;
  final String? typeName;
  final String? metaName;
  final DisplayNameKind kind;

  @override
  String toString() {
    return metaName ?? (typeName != null ? "$typeName $instanceName" : instanceName);
  }
}
