// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expand_end_date_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpandEndDateRequest _$ExpandEndDateRequestFromJson(
        Map<String, dynamic> json) =>
    ExpandEndDateRequest(
      jobId: json['id'] as int,
      endDate: DateTime.parse(json['end_date'] as String),
    );

Map<String, dynamic> _$ExpandEndDateRequestToJson(
        ExpandEndDateRequest instance) =>
    <String, dynamic>{
      'id': instance.jobId,
      'end_date': instance.endDate.toIso8601String(),
    };
