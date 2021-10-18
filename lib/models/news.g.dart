// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) => News(
      banner: json['banner'] as String?,
      createdDate: json['created_date'] == null
          ? null
          : DateTime.parse(json['created_date'] as String),
      status: json['status'] as int?,
      group: json['group'] == null
          ? null
          : Group.fromJson(json['group'] as Map<String, dynamic>),
      title: json['title'] as String?,
      content: json['content'] as String?,
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NewsToJson(News instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('banner', instance.banner);
  writeNotNull('title', instance.title);
  writeNotNull('content', instance.content);
  writeNotNull('created_date', instance.createdDate?.toIso8601String());
  writeNotNull('status', instance.status);
  writeNotNull('group', instance.group?.toJson());
  writeNotNull('tags', instance.tags?.map((e) => e.toJson()).toList());
  return val;
}
