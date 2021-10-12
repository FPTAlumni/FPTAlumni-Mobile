// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventRequest _$EventRequestFromJson(Map<String, dynamic> json) => EventRequest(
      eventName: json['eventName'] as String?,
      eventContent: json['eventContent'] as String?,
      location: json['location'] as String?,
      registrationStartDate: json['registrationStartDate'] == null
          ? null
          : DateTime.parse(json['registrationStartDate'] as String),
      registrationEndDate: json['registrationEndDate'] == null
          ? null
          : DateTime.parse(json['registrationEndDate'] as String),
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      groupId: json['groupId'] as String?,
      alumniId: json['alumniId'] as String?,
      status: _$enumDecodeNullable(_$EventStatusEnumMap, json['status']),
      page: json['page'] as String?,
      pageSize: json['page-size'] as String? ?? '10',
      sortKey: _$enumDecodeNullable(_$EventSortKeyEnumMap, json['sort-key']),
      sortOrder: _$enumDecodeNullable(_$SortOrderEnumMap, json['sort-order']) ??
          SortOrder.DESC,
    );

Map<String, dynamic> _$EventRequestToJson(EventRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('eventName', instance.eventName);
  writeNotNull('eventContent', instance.eventContent);
  writeNotNull('location', instance.location);
  writeNotNull('registrationStartDate',
      instance.registrationStartDate?.toIso8601String());
  writeNotNull(
      'registrationEndDate', instance.registrationEndDate?.toIso8601String());
  writeNotNull('startDate', instance.startDate?.toIso8601String());
  writeNotNull('endDate', instance.endDate?.toIso8601String());
  writeNotNull('groupId', instance.groupId);
  writeNotNull('alumniId', instance.alumniId);
  writeNotNull('status', _$EventStatusEnumMap[instance.status]);
  writeNotNull('page', instance.page);
  writeNotNull('page-size', instance.pageSize);
  writeNotNull('sort-key', _$EventSortKeyEnumMap[instance.sortKey]);
  writeNotNull('sort-order', _$SortOrderEnumMap[instance.sortOrder]);
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

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$EventStatusEnumMap = {
  EventStatus.notStart: 'NotStart',
  EventStatus.registrationStart: 'RegistrationStart',
  EventStatus.registrationEnd: 'RegistrationEnd',
  EventStatus.inProgress: 'InProgress',
  EventStatus.end: 'End',
  EventStatus.delete: 'Delete',
};

const _$EventSortKeyEnumMap = {
  EventSortKey.eventName: 'EventName',
  EventSortKey.location: 'Location',
  EventSortKey.registrationStartDate: 'RegistrationStartDate',
  EventSortKey.registrationEndDate: 'RegistrationEndDate',
  EventSortKey.endDate: 'EndDate',
};

const _$SortOrderEnumMap = {
  SortOrder.DESC: 'DESC',
  SortOrder.ASC: 'ASC',
};
