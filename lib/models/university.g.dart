// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'university.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

University _$UniversityFromJson(Map<String, dynamic> json) => University(
      id: json['id'] as int,
      name: json['name'] as String,
      logo: json['logo'] as String?,
      address: json['address'] as String?,
      classes: (json['classes'] as List<dynamic>?)
          ?.map((e) => Clazz.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UniversityToJson(University instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('logo', instance.logo);
  writeNotNull('address', instance.address);
  writeNotNull('classes', instance.classes?.map((e) => e.toJson()).toList());
  return val;
}
