// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clazz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Clazz _$ClazzFromJson(Map<String, dynamic> json) => Clazz(
      id: json['id'] as int,
      name: json['class_of'] as String,
      startYear: json['start_year'] as int?,
    );

Map<String, dynamic> _$ClazzToJson(Clazz instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'class_of': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('start_year', instance.startYear);
  return val;
}
