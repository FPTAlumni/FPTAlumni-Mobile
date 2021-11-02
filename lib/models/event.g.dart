// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      id: json['id'] as int,
      eventContent: json['event_content'] as String,
      location: json['location'] as String,
      banner: json['banner'] as String,
      eventName: json['event_name'] as String,
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: DateTime.parse(json['end_date'] as String),
      groupId: json['group_id'] as int,
      registrationStartDate:
          DateTime.parse(json['registration_start_date'] as String),
      registrationEndDate:
          DateTime.parse(json['registration_end_date'] as String),
      inEvent: json['in_event'] as bool,
      createdDate: DateTime.parse(json['created_date'] as String),
      groupName: json['group_name'] as String?,
    );

Map<String, dynamic> _$EventToJson(Event instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'event_name': instance.eventName,
    'event_content': instance.eventContent,
    'banner': instance.banner,
    'location': instance.location,
    'registration_start_date': instance.registrationStartDate.toIso8601String(),
    'registration_end_date': instance.registrationEndDate.toIso8601String(),
    'start_date': instance.startDate.toIso8601String(),
    'end_date': instance.endDate.toIso8601String(),
    'group_id': instance.groupId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('group_name', instance.groupName);
  val['created_date'] = instance.createdDate.toIso8601String();
  val['in_event'] = instance.inEvent;
  return val;
}
