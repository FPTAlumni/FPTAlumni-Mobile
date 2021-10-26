import 'package:json_annotation/json_annotation.dart';

part 'recruitment_post_request.g.dart';

@JsonSerializable(includeIfNull: false)
class RecruitmentPostRequest {
  int? id;
  String? title;
  String? description;
  String? position;

  @JsonKey(name: 'experience_level')
  String? experience;
  String? phone;
  String? email;

  @JsonKey(name: 'end_date')
  DateTime? endDate;

  @JsonKey(name: 'alumni_id')
  int? alumniId;

  @JsonKey(name: 'group_id')
  int? groupId;

  @JsonKey(name: 'company_id')
  int? companyId;

  @JsonKey(name: 'group_origin_id')
  int? groupOriginId;

  int? type;

  RecruitmentPostRequest({
    this.id,
    this.alumniId,
    this.title,
    this.groupId,
    this.endDate,
    this.description,
    this.type,
    this.position,
    this.email,
    this.phone,
    this.companyId,
    this.experience,
    this.groupOriginId,
  });

  Map<String, dynamic> toJson() => _$RecruitmentPostRequestToJson(this);
}
