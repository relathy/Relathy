import 'package:meta/meta.dart';
import 'package:relathy_shared/domain_layer/core_module/data/aggregates/common/display_name.dart';
import 'package:relathy_shared/domain_layer/core_module/data/aggregates/aggregate.dart';

@immutable
class CategorySelector implements Aggregate {
  final List<DisplayName> displayNames;

  CategorySelector({required this.displayNames});
}
