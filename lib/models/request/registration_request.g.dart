// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationRequest _$RegistrationRequestFromJson(Map<String, dynamic> json) =>
    RegistrationRequest(
      uid: json['uid'] as String,
      phone: json['phone'] as String,
      fullName: json['full_name'] as String,
      dob: DateTime.parse(json['dob'] as String),
      classId: json['class_id'] as int,
      address: json['address'] as String?,
      aboutMe: json['about_me'] as String?,
      companyId: json['company_id'] as int?,
      job: json['job'] as String?,
      majorId: json['major_id'] as int?,
    );

Map<String, dynamic> _$RegistrationRequestToJson(RegistrationRequest instance) {
  final val = <String, dynamic>{
    'uid': instance.uid,
    'phone': instance.phone,
    'full_name': instance.fullName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('address', instance.address);
  val['dob'] = instance.dob.toIso8601String();
  writeNotNull('job', instance.job);
  writeNotNull('about_me', instance.aboutMe);
  writeNotNull('company_id', instance.companyId);
  writeNotNull('major_id', instance.majorId);
  val['class_id'] = instance.classId;
  return val;
}
