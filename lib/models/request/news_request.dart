import 'package:json_annotation/json_annotation.dart';
import 'package:uni_alumni/shared/data/enum/common_enum.dart';
import 'package:uni_alumni/shared/data/enum/news_enum.dart';

part 'news_request.g.dart';

@JsonSerializable(includeIfNull: false)
class NewsRequest {
  @JsonValue('title')
  String? title;

  @JsonValue('groupId')
  String? groupId;

  @JsonValue('categoryId')
  String? categoryId;

  @JsonValue('tagId')
  String? tagId;

  @JsonKey(name: 'status', defaultValue: NewsStatus.active)
  NewsStatus? status;

  @JsonKey(name: 'page')
  String? page;

  @JsonKey(name: 'page-size', defaultValue: '10')
  String? pageSize;

  @JsonKey(name: 'sort-key', defaultValue: NewsSort.createdDate)
  NewsSort? sortKey;

  @JsonKey(name: 'sort-order', defaultValue: SortOrder.DESC)
  SortOrder? sortOrder;

  NewsRequest({
    this.title,
    this.groupId,
    this.sortOrder,
    this.pageSize,
    this.categoryId,
    this.page,
    this.tagId,
    this.status,
    this.sortKey,
  });

  Map<String, dynamic> toJson() => _$NewsRequestToJson(this);
}
