// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recruitment_post_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecruitmentPostRequest _$RecruitmentPostRequestFromJson(
        Map<String, dynamic> json) =>
    RecruitmentPostRequest(
      alumniId: json['alumni_id'] as int?,
      title: json['title'] as String?,
      groupId: json['group_id'] as int?,
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      description: json['description'] as String?,
      type: json['type'] as int?,
      position: json['position'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      companyId: json['company_id'] as int?,
      experience: json['experience_level'] as String?,
      groupOriginId: json['group_origin_id'] as int?,
    );

Map<String, dynamic> _$RecruitmentPostRequestToJson(
    RecruitmentPostRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  writeNotNull('description', instance.description);
  writeNotNull('position', instance.position);
  writeNotNull('experience_level', instance.experience);
  writeNotNull('phone', instance.phone);
  writeNotNull('email', instance.email);
  writeNotNull('end_date', instance.endDate?.toIso8601String());
  writeNotNull('alumni_id', instance.alumniId);
  writeNotNull('group_id', instance.groupId);
  writeNotNull('company_id', instance.companyId);
  writeNotNull('group_origin_id', instance.groupOriginId);
  writeNotNull('type', instance.type);
  return val;
}
