import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
part 'application_info.g.dart';

@immutable
@JsonSerializable()
class ApplicationInfo {
  ApplicationInfo();
  factory ApplicationInfo.fromJson(Map<String, dynamic> json) => _$ApplicationInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ApplicationInfoToJson(this);
}
