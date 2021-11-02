// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alumni_group_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlumniGroupResponse _$AlumniGroupResponseFromJson(Map<String, dynamic> json) =>
    AlumniGroupResponse(
      status: json['status'] as String?,
      groupId: json['group_id'] as int?,
      alumni: json['alumni'] == null
          ? null
          : Alumni.fromJson(json['alumni'] as Map<String, dynamic>),
      registeredDate: json['registered_date'] == null
          ? null
          : DateTime.parse(json['registered_date'] as String),
    );

Map<String, dynamic> _$AlumniGroupResponseToJson(AlumniGroupResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('alumni', instance.alumni?.toJson());
  writeNotNull('group_id', instance.groupId);
  writeNotNull('registered_date', instance.registeredDate?.toIso8601String());
  writeNotNull('status', instance.status);
  return val;
}
