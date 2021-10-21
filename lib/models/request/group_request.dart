import 'package:json_annotation/json_annotation.dart';
import 'package:uni_alumni/shared/data/enum/common_enum.dart';
import 'package:uni_alumni/shared/data/enum/recruitment_enum.dart';

part 'group_request.g.dart';

@JsonSerializable(includeIfNull: false)
class GroupRequest {
  String? groupName;

  String? alumniId;

  String? groupLeaderId;

  String? parentGroupId;

  String? majorId;

  String? universityId;

  @JsonKey(name: 'page')
  String? page;

  @JsonKey(name: 'size', defaultValue: '10')
  String? pageSize;

  @JsonKey(name: 'status')
  RecruitmentStatus? status;

  @JsonKey(name: 'sort-key')
  RecruitmentSortKey? recruitmentSortKey;

  @JsonKey(name: 'sort-order', defaultValue: SortOrder.DESC)
  SortOrder? sortOrder;

  GroupRequest({
    this.groupName,
    this.recruitmentSortKey,
    this.status,
    this.page,
    this.pageSize,
    this.sortOrder,
    this.alumniId,
    this.universityId,
    this.groupLeaderId,
    this.majorId,
    this.parentGroupId,
  });

  Map<String, dynamic> toJson() => _$GroupRequestToJson(this);
}
