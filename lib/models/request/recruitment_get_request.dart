import 'package:json_annotation/json_annotation.dart';
import 'package:uni_alumni/shared/data/enum/common_enum.dart';
import 'package:uni_alumni/shared/data/enum/recruitment_enum.dart';

part 'recruitment_get_request.g.dart';

@JsonSerializable(includeIfNull: false)
class RecruitmentGetRequest {
  String? alumniId;

  String? companyId;

  String? majorId;

  String? groupId;

  @JsonKey(name: 'page')
  String? page;

  @JsonKey(name: 'page-size', defaultValue: '10')
  String? pageSize;

  @JsonKey(name: 'sort-key', defaultValue: RecruitmentSortKey.createdDate)
  RecruitmentSortKey? sortKey;

  @JsonKey(name: 'sort-order', defaultValue: SortOrder.DESC)
  SortOrder? sortOrder;

  RecruitmentGetRequest({
    this.alumniId,
    this.companyId,
    this.groupId,
    this.majorId,
    this.sortOrder,
    this.pageSize,
    this.page,
    this.sortKey,
  });

  Map<String, dynamic> toJson() => _$RecruitmentGetRequestToJson(this);
}
