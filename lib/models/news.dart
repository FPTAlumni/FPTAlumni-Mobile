import 'package:json_annotation/json_annotation.dart';
import 'package:uni_alumni/models/group.dart';
import 'package:uni_alumni/models/tag.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class News {
  @JsonValue("banner")
  String? banner;

  @JsonValue("title")
  String? title;

  @JsonValue("content")
  String? content;

  @JsonValue("created_date")
  DateTime? createdDate;

  @JsonValue("status")
  int? status;

  @JsonValue("group")
  Group? group;

  @JsonValue("tags")
  List<Tag>? tags;
}
