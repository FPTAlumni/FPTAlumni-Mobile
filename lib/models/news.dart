import 'package:json_annotation/json_annotation.dart';
import 'package:uni_alumni/models/group.dart';
import 'package:uni_alumni/models/tag.dart';

part 'news.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class News {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "banner")
  String? banner;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "content")
  String? content;

  @JsonKey(name: "created_date")
  DateTime? createdDate;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "group")
  Group? group;

  @JsonKey(name: "tags")
  List<Tag>? tags;

  News(
      {required this.id,
      this.banner,
      this.createdDate,
      this.status,
      this.group,
      this.title,
      this.content,
      this.tags});

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);
}
