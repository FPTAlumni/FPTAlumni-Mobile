// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupRequest _$GroupRequestFromJson(Map<String, dynamic> json) => GroupRequest(
      groupName: json['groupName'] as String?,
      recruitmentSortKey:
          _$enumDecodeNullable(_$GroupSortKeyEnumMap, json['sort-key']),
      status: _$enumDecodeNullable(_$GroupStatusEnumMap, json['status']),
      page: json['page'] as String?,
      pageSize: json['size'] as String? ?? '10',
      sortOrder: _$enumDecodeNullable(_$SortOrderEnumMap, json['sort-order']) ??
          SortOrder.DESC,
      alumniId: json['alumniId'] as String?,
      universityId: json['universityId'] as String?,
      groupLeaderId: json['groupLeaderId'] as String?,
      majorId: json['majorId'] as String?,
      parentGroupId: json['parentGroupId'] as String?,
      joined: json['joined'] as String?,
    );

Map<String, dynamic> _$GroupRequestToJson(GroupRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('groupName', instance.groupName);
  writeNotNull('alumniId', instance.alumniId);
  writeNotNull('joined', instance.joined);
  writeNotNull('groupLeaderId', instance.groupLeaderId);
  writeNotNull('parentGroupId', instance.parentGroupId);
  writeNotNull('majorId', instance.majorId);
  writeNotNull('universityId', instance.universityId);
  writeNotNull('page', instance.page);
  writeNotNull('size', instance.pageSize);
  writeNotNull('status', _$GroupStatusEnumMap[instance.status]);
  writeNotNull('sort-key', _$GroupSortKeyEnumMap[instance.recruitmentSortKey]);
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

const _$GroupSortKeyEnumMap = {
  GroupSortKey.createdDate: 'CreatedDate',
  GroupSortKey.groupName: 'GroupName',
  GroupSortKey.status: 'Status',
};

const _$GroupStatusEnumMap = {
  GroupStatus.active: 'Active',
  GroupStatus.inActive: 'Inactive',
};

const _$SortOrderEnumMap = {
  SortOrder.DESC: 'DESC',
  SortOrder.ASC: 'ASC',
};
