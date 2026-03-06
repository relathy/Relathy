import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';
import 'package:relathy_shared/domain_layer/core_module/data/aggregates/common/display_name.dart';
import 'package:relathy_shared/domain_layer/core_module/data/aggregates/aggregate.dart';
import 'package:relathy_shared/domain_layer/core_module/data/aggregates/templates/class_template.dart';
import 'package:relathy_shared/domain_layer/core_module/data/aggregates/templates/property_type_template.dart';

@immutable
class ViewClassTemplate implements Aggregate {
  final TypeTemplate typeTemplate;
  final List<MixinTemplate> mixinTemplates;
  late final _viewPropertyTypeTemplatesComputed = Computed(_computeViewPropertyTypeTemplates);

  ViewClassTemplate({required this.typeTemplate, required this.mixinTemplates});

  List<PropertyTypeTemplate> get viewPropertyTypeTemplates => _viewPropertyTypeTemplatesComputed.value;

  List<PropertyTypeTemplate> _computeViewPropertyTypeTemplates() {
    final result = <PropertyTypeTemplate>[];
    result.addAll(typeTemplate.propertyTypeTemplates);
    for (var mixin in mixinTemplates) {
      result.addAll(mixin.propertyTypeTemplates);
    }
    result.sort(_comparePropertyTypeTemplates);
    return result;
  }

  int _comparePropertyTypeTemplates(PropertyTypeTemplate t1, PropertyTypeTemplate t2) {
    var labelTypeIndex1 = _getLabelTypeIndex(t1.displayName.kind);
    var labelTypeIndex2 = _getLabelTypeIndex(t2.displayName.kind);
    var labelTypeDiff = labelTypeIndex1 - labelTypeIndex2;
    if (labelTypeDiff != 0) {
      return labelTypeDiff;
    }
    return t1.displayName.instanceName.compareTo(t2.displayName.instanceName);
  }

  int _getLabelTypeIndex(DisplayNameKind labelType) {
    switch (labelType) {
      case DisplayNameKind.individual:
      case DisplayNameKind.type:
      case DisplayNameKind.role:
      case DisplayNameKind.category:
      case DisplayNameKind.valueType:
      case DisplayNameKind.phase:
        throw Error();
      case DisplayNameKind.ownedRelationshipType:
        return 0;
      case DisplayNameKind.partOfLabelAttributeType:
        return 1;
      case DisplayNameKind.typeAttributeType:
        return 2;
      case DisplayNameKind.categoryAttributeType:
        return 3;
      case DisplayNameKind.phaseAttributeType:
        return 4;
      case DisplayNameKind.attributeType:
        return 5;
      case DisplayNameKind.contentAttributeType:
        return 6;
      case DisplayNameKind.associationRelationshipType:
        return 7;
      case DisplayNameKind.ownerRelationshipType:
        return 8;
    }
  }
}
