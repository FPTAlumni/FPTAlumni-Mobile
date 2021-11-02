// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alumni_group_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlumniGroupRequest _$AlumniGroupRequestFromJson(Map<String, dynamic> json) =>
    AlumniGroupRequest(
      groupId: json['id'] as String,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$AlumniGroupRequestToJson(AlumniGroupRequest instance) {
  final val = <String, dynamic>{
    'id': instance.groupId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  return val;
}
