import 'package:json_annotation/json_annotation.dart';

part 'major.g.dart';

@JsonSerializable(includeIfNull: false)
class Major {
  @JsonKey(name: 'short_name')
  String shortName;

  @JsonKey(name: 'vietnamese_name')
  String vietnameseName;

  @JsonKey(name: 'created_date')
  DateTime? createdDate;

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'full_name')
  String fullName;

  Major({
    required this.shortName,
    required this.vietnameseName,
    required this.status,
    required this.id,
    required this.fullName,
    this.createdDate,
  });

  factory Major.fromJson(Map<String, dynamic> json) => _$MajorFromJson(json);
  Map<String, dynamic> toJson() => _$MajorToJson(this);
}
