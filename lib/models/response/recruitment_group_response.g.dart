// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recruitment_group_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecruitmentGroupResponse _$RecruitmentGroupResponseFromJson(
        Map<String, dynamic> json) =>
    RecruitmentGroupResponse(
      id: json['id'] as int?,
      banner: json['banner'] as String?,
      groupName: json['group_name'] as String?,
    );

Map<String, dynamic> _$RecruitmentGroupResponseToJson(
        RecruitmentGroupResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'banner': instance.banner,
      'group_name': instance.groupName,
    };
