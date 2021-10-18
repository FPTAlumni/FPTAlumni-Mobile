// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recruitment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recruitment _$RecruitmentFromJson(Map<String, dynamic> json) => Recruitment(
      major: json['major'] == null
          ? null
          : Major.fromJson(json['major'] as Map<String, dynamic>),
      alumni: json['alumni'] == null
          ? null
          : Alumni.fromJson(json['alumni'] as Map<String, dynamic>),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      createdDate: json['created_date'] == null
          ? null
          : DateTime.parse(json['created_date'] as String),
      position: json['position'] as String?,
      status: json['status'] as String?,
      type: json['type'] as String?,
      company: json['company'] == null
          ? null
          : Company.fromJson(json['company'] as Map<String, dynamic>),
      description: json['description'] as String?,
      title: json['title'] as String?,
      group: json['group'] == null
          ? null
          : Group.fromJson(json['group'] as Map<String, dynamic>),
      experienceLevel: json['experience_level'] as String?,
      groupOrigin: json['group_origin'] == null
          ? null
          : Group.fromJson(json['group_origin'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecruitmentToJson(Recruitment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  writeNotNull('description', instance.description);
  writeNotNull('position', instance.position);
  writeNotNull('type', instance.type);
  writeNotNull('status', instance.status);
  writeNotNull('experience_level', instance.experienceLevel);
  writeNotNull('phone', instance.phone);
  writeNotNull('email', instance.email);
  writeNotNull('end_date', instance.endDate?.toIso8601String());
  writeNotNull('created_date', instance.createdDate?.toIso8601String());
  writeNotNull('alumni', instance.alumni?.toJson());
  writeNotNull('group', instance.group?.toJson());
  writeNotNull('company', instance.company?.toJson());
  writeNotNull('group_origin', instance.groupOrigin?.toJson());
  writeNotNull('major', instance.major?.toJson());
  return val;
}
