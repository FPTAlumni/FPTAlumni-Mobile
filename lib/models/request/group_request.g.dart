// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupRequest _$GroupRequestFromJson(Map<String, dynamic> json) => GroupRequest(
      groupName: json['groupName'] as String?,
      recruitmentSortKey:
          _$enumDecodeNullable(_$RecruitmentSortKeyEnumMap, json['sort-key']),
      status: _$enumDecodeNullable(_$RecruitmentStatusEnumMap, json['status']),
      page: json['page'] as String?,
      pageSize: json['size'] as String? ?? '10',
      sortOrder: _$enumDecodeNullable(_$SortOrderEnumMap, json['sort-order']) ??
          SortOrder.DESC,
      alumniId: json['alumniId'] as String?,
      universityId: json['universityId'] as String?,
      groupLeaderId: json['groupLeaderId'] as String?,
      majorId: json['majorId'] as String?,
      parentGroupId: json['parentGroupId'] as String?,
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
  writeNotNull('groupLeaderId', instance.groupLeaderId);
  writeNotNull('parentGroupId', instance.parentGroupId);
  writeNotNull('majorId', instance.majorId);
  writeNotNull('universityId', instance.universityId);
  writeNotNull('page', instance.page);
  writeNotNull('size', instance.pageSize);
  writeNotNull('status', _$RecruitmentStatusEnumMap[instance.status]);
  writeNotNull(
      'sort-key', _$RecruitmentSortKeyEnumMap[instance.recruitmentSortKey]);
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

const _$RecruitmentSortKeyEnumMap = {
  RecruitmentSortKey.createdDate: 'CreatedDate',
  RecruitmentSortKey.groupName: 'GroupName',
  RecruitmentSortKey.status: 'Status',
};

const _$RecruitmentStatusEnumMap = {
  RecruitmentStatus.active: 'Active',
  RecruitmentStatus.inActive: 'Inactive',
};

const _$SortOrderEnumMap = {
  SortOrder.DESC: 'DESC',
  SortOrder.ASC: 'ASC',
};
