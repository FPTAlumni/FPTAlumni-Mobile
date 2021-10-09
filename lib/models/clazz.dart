import 'package:json_annotation/json_annotation.dart';

part 'clazz.g.dart';

@JsonSerializable(includeIfNull: false)
class Clazz {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'class_of')
  String name;

  @JsonKey(name: 'start_year')
  int? startYear;

  Clazz({required this.id, required this.name, this.startYear});

  factory Clazz.fromJson(Map<String, dynamic> json) => _$ClazzFromJson(json);
  Map<String, dynamic> toJson() => _$ClazzToJson(this);
}
