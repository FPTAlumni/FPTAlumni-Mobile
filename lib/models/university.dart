import 'package:json_annotation/json_annotation.dart';

part 'university.g.dart';

@JsonSerializable(includeIfNull: false)
class University {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'logo')
  String? logo;

  @JsonKey(name: 'address')
  String? address;

  University({required this.id, required this.name, this.logo, this.address});

  factory University.fromJson(Map<String, dynamic> json) =>
      _$UniversityFromJson(json);
  Map<String, dynamic> toJson() => _$UniversityToJson(this);
}
