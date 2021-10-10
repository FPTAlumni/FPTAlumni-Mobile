// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'major.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Major _$MajorFromJson(Map<String, dynamic> json) => Major(
      shortName: json['short_name'] as String,
      vietnameseName: json['vietnamese_name'] as String,
      status: json['status'] as int,
      id: json['id'] as int,
      fullName: json['full_name'] as String,
      createdDate: json['created_date'] == null
          ? null
          : DateTime.parse(json['created_date'] as String),
    );

Map<String, dynamic> _$MajorToJson(Major instance) {
  final val = <String, dynamic>{
    'short_name': instance.shortName,
    'vietnamese_name': instance.vietnameseName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('created_date', instance.createdDate?.toIso8601String());
  val['status'] = instance.status;
  val['id'] = instance.id;
  val['full_name'] = instance.fullName;
  return val;
}
