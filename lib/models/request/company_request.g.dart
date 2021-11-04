// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyRequest _$CompanyRequestFromJson(Map<String, dynamic> json) =>
    CompanyRequest(
      companyName: json['company-name'] as String?,
      location: json['location'] as String?,
      business: json['business'] as String?,
      page: json['page'] as String?,
      pageSize: json['page-size'] as String? ?? '50',
      sortKey: json['sort-key'] as String?,
      sortOrder: _$enumDecodeNullable(_$SortOrderEnumMap, json['sort-order']),
    );

Map<String, dynamic> _$CompanyRequestToJson(CompanyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('company-name', instance.companyName);
  writeNotNull('location', instance.location);
  writeNotNull('business', instance.business);
  writeNotNull('page', instance.page);
  writeNotNull('page-size', instance.pageSize);
  writeNotNull('sort-key', instance.sortKey);
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
