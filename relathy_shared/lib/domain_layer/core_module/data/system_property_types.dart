import 'package:meta/meta.dart';
import 'package:relathy_shared/domain_layer/core_module/data/object.dart';

@immutable
abstract class PropertyType {
  final ObjectId id;

  const PropertyType(this.id);
}

@immutable
abstract class AttributeType extends PropertyType {
  const AttributeType(super.id);
}

@immutable
abstract class RelationshipType extends PropertyType {
  const RelationshipType(super.id);
}

@immutable
class TextAttributeType extends AttributeType {
  const TextAttributeType(super.id);
}

@immutable
class ReferenceAttributeType extends AttributeType {
  const ReferenceAttributeType(super.id);
}

@immutable
class ContentAttributeType extends AttributeType {
  const ContentAttributeType(super.id);
}

@immutable
class CategoryAttributeType extends AttributeType {
  const CategoryAttributeType(super.id);
}

@immutable
class ObjectAttributeType extends AttributeType {
  const ObjectAttributeType(super.id);
}

@immutable
class ObjectListAttributeType extends AttributeType {
  const ObjectListAttributeType(super.id);
}

@immutable
class ToOneRelationshipType extends RelationshipType {
  const ToOneRelationshipType(super.id);
}

@immutable
class ToManyRelationshipType extends RelationshipType {
  const ToManyRelationshipType(super.id);
}
