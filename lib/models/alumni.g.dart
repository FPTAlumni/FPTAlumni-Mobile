// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alumni.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Alumni _$AlumniFromJson(Map<String, dynamic> json) => Alumni(
      id: json['id'] as int,
      email: json['email'] as String,
      phone: json['phone'] as String,
      fullName: json['full_name'] as String,
      uid: json['uid'] as String,
      dob: DateTime.parse(json['dob'] as String),
      createdDate: DateTime.parse(json['created_date'] as String),
      status: _$enumDecode(_$AlumniStatusEnumMap, json['status']),
      major: json['major'] == null
          ? null
          : Major.fromJson(json['major'] as Map<String, dynamic>),
      company: json['company'] == null
          ? null
          : Company.fromJson(json['company'] as Map<String, dynamic>),
      clazz: json['class'] == null
          ? null
          : Clazz.fromJson(json['class'] as Map<String, dynamic>),
      aboutMe: json['about_me'] as String?,
      address: json['address'] as String?,
      job: json['job'] as String?,
    );

Map<String, dynamic> _$AlumniToJson(Alumni instance) {
  final val = <String, dynamic>{
    'email': instance.email,
    'phone': instance.phone,
    'full_name': instance.fullName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('address', instance.address);
  val['uid'] = instance.uid;
  val['dob'] = instance.dob.toIso8601String();
  writeNotNull('job', instance.job);
  writeNotNull('about_me', instance.aboutMe);
  val['created_date'] = instance.createdDate.toIso8601String();
  val['status'] = _$AlumniStatusEnumMap[instance.status];
  val['id'] = instance.id;
  writeNotNull('major', instance.major?.toJson());
  writeNotNull('class', instance.clazz?.toJson());
  writeNotNull('company', instance.company?.toJson());
  return val;
}

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$AlumniStatusEnumMap = {
  AlumniStatus.reject: 'Reject',
  AlumniStatus.pending: 'Pending',
  AlumniStatus.active: 'Active',
  AlumniStatus.deactive: 'Deactive',
};
