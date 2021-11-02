// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alumni_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlumniRequest _$AlumniRequestFromJson(Map<String, dynamic> json) =>
    AlumniRequest(
      id: json['id'] as int?,
      phone: json['phone'] as String?,
      fullName: json['full_name'] as String?,
      address: json['address'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      job: json['job'] as String?,
      aboutMe: json['about_me'] as String?,
      companyId: json['company_id'] as int?,
      majorId: json['major_id'] as int?,
      classId: json['class_id'] as int?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$AlumniRequestToJson(AlumniRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('phone', instance.phone);
  writeNotNull('full_name', instance.fullName);
  writeNotNull('address', instance.address);
  writeNotNull('dob', instance.dob?.toIso8601String());
  writeNotNull('job', instance.job);
  writeNotNull('about_me', instance.aboutMe);
  writeNotNull('company_id', instance.companyId);
  writeNotNull('major_id', instance.majorId);
  writeNotNull('class_id', instance.classId);
  writeNotNull('image', instance.image);
  return val;
}
