// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Group _$GroupFromJson(Map<String, dynamic> json) => Group(
      status: json['status'] as int?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      id: json['id'] as int?,
      university: json['university'] == null
          ? null
          : University.fromJson(json['university'] as Map<String, dynamic>),
      banner: json['banner'] as String?,
      groupName: json['groupName'] as String?,
      leader: json['leader'] == null
          ? null
          : Alumni.fromJson(json['leader'] as Map<String, dynamic>),
      numberOfMembers: json['numberOfMembers'] as int?,
      registrationDate: json['registrationDate'] == null
          ? null
          : DateTime.parse(json['registrationDate'] as String),
    );

Map<String, dynamic> _$GroupToJson(Group instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('banner', instance.banner);
  writeNotNull('groupName', instance.groupName);
  writeNotNull(
      'registrationDate', instance.registrationDate?.toIso8601String());
  writeNotNull('createdDate', instance.createdDate?.toIso8601String());
  writeNotNull('status', instance.status);
  writeNotNull('numberOfMembers', instance.numberOfMembers);
  writeNotNull('leader', instance.leader?.toJson());
  writeNotNull('university', instance.university?.toJson());
  return val;
}
