// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recruitment_get_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecruitmentGetRequest _$RecruitmentGetRequestFromJson(
        Map<String, dynamic> json) =>
    RecruitmentGetRequest(
      alumniId: json['alumniId'] as String?,
      companyId: json['companyId'] as String?,
      groupId: json['groupId'] as String?,
      majorId: json['majorId'] as String?,
      sortOrder: _$enumDecodeNullable(_$SortOrderEnumMap, json['sort-order']) ??
          SortOrder.DESC,
      pageSize: json['page-size'] as String? ?? '10',
      page: json['page'] as String?,
      sortKey:
          _$enumDecodeNullable(_$RecruitmentSortKeyEnumMap, json['sort-key']) ??
              RecruitmentSortKey.createdDate,
      status:
          _$enumDecodeNullable(_$RecruitmentStatusEnumMap, json['status']) ??
              RecruitmentStatus.none,
    );

Map<String, dynamic> _$RecruitmentGetRequestToJson(
    RecruitmentGetRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('alumniId', instance.alumniId);
  writeNotNull('companyId', instance.companyId);
  writeNotNull('majorId', instance.majorId);
  writeNotNull('groupId', instance.groupId);
  writeNotNull('page', instance.page);
  writeNotNull('page-size', instance.pageSize);
  writeNotNull('status', _$RecruitmentStatusEnumMap[instance.status]);
  writeNotNull('sort-key', _$RecruitmentSortKeyEnumMap[instance.sortKey]);
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

const _$SortOrderEnumMap = {
  SortOrder.DESC: 'DESC',
  SortOrder.ASC: 'ASC',
};

const _$RecruitmentSortKeyEnumMap = {
  RecruitmentSortKey.createdDate: 'CreatedDate',
  RecruitmentSortKey.title: 'Title',
  RecruitmentSortKey.status: 'Status',
};

const _$RecruitmentStatusEnumMap = {
  RecruitmentStatus.rejected: 'Rejected',
  RecruitmentStatus.active: 'Active',
  RecruitmentStatus.pending: 'Pending',
  RecruitmentStatus.none: null,
};
