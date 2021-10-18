import 'package:json_annotation/json_annotation.dart';

part 'tag.g.dart';

@JsonSerializable(includeIfNull: false)
class Tag {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "tagname")
  String? tagName;

  Tag({this.id, this.tagName});

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}
