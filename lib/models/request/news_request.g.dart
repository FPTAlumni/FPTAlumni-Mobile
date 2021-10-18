// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsRequest _$NewsRequestFromJson(Map<String, dynamic> json) => NewsRequest(
      title: json['title'] as String?,
      groupId: json['groupId'] as String?,
      sortOrder: _$enumDecodeNullable(_$SortOrderEnumMap, json['sort-order']) ??
          SortOrder.DESC,
      pageSize: json['page-size'] as String? ?? '10',
      categoryId: json['categoryId'] as String?,
      page: json['page'] as String?,
      tagId: json['tagId'] as String?,
      status: _$enumDecodeNullable(_$NewsStatusEnumMap, json['status']) ??
          NewsStatus.active,
      sortKey: _$enumDecodeNullable(_$NewsSortEnumMap, json['sort-key']) ??
          NewsSort.createdDate,
    );

Map<String, dynamic> _$NewsRequestToJson(NewsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  writeNotNull('groupId', instance.groupId);
  writeNotNull('categoryId', instance.categoryId);
  writeNotNull('tagId', instance.tagId);
  writeNotNull('status', _$NewsStatusEnumMap[instance.status]);
  writeNotNull('page', instance.page);
  writeNotNull('page-size', instance.pageSize);
  writeNotNull('sort-key', _$NewsSortEnumMap[instance.sortKey]);
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

const _$NewsStatusEnumMap = {
  NewsStatus.active: 'Active',
  NewsStatus.inactive: 'Inactive',
};

const _$NewsSortEnumMap = {
  NewsSort.title: 'Title',
  NewsSort.createdDate: 'CreatedDate',
  NewsSort.status: 'status',
};
