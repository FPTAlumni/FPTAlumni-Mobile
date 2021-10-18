// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Job _$JobFromJson(Map<String, dynamic> json) => Job(
      id: json['id'] as int,
      companyName: json['companyName'] as String,
      location: json['location'] as String,
      business: json['business'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$JobToJson(Job instance) => <String, dynamic>{
      'id': instance.id,
      'companyName': instance.companyName,
      'location': instance.location,
      'business': instance.business,
      'description': instance.description,
    };
