// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Group _$GroupFromJson(Map<String, dynamic> json) => Group(
      status: json['status'] as int?,
      createdDate: json['created_date'] == null
          ? null
          : DateTime.parse(json['created_date'] as String),
      id: json['id'] as int?,
      university: json['university'] == null
          ? null
          : University.fromJson(json['university'] as Map<String, dynamic>),
      banner: json['banner'] as String?,
      groupName: json['group_name'] as String?,
      leader: json['group_leader'] == null
          ? null
          : Alumni.fromJson(json['group_leader'] as Map<String, dynamic>),
      numberOfMembers: json['number_of_members'] as int?,
      registrationDate: json['registered_date'] == null
          ? null
          : DateTime.parse(json['registered_date'] as String),
      isJoined: json['joined'] as bool?,
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
  writeNotNull('group_name', instance.groupName);
  writeNotNull('registered_date', instance.registrationDate?.toIso8601String());
  writeNotNull('created_date', instance.createdDate?.toIso8601String());
  writeNotNull('joined', instance.isJoined);
  writeNotNull('status', instance.status);
  writeNotNull('number_of_members', instance.numberOfMembers);
  writeNotNull('group_leader', instance.leader?.toJson());
  writeNotNull('university', instance.university?.toJson());
  return val;
}
