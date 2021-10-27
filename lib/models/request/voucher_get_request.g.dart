// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher_get_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VoucherRequest _$VoucherRequestFromJson(Map<String, dynamic> json) =>
    VoucherRequest(
      majorId: json['major_id'] as String?,
      status: json['status'] as String?,
      page: json['page'] as String?,
      pageSize: json['page_size'] as String? ?? '10',
      sortKey: json['sort_key'] as String?,
      sortOrder: _$enumDecodeNullable(_$SortOrderEnumMap, json['sort_order']),
    );

Map<String, dynamic> _$VoucherRequestToJson(VoucherRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('major_id', instance.majorId);
  writeNotNull('status', instance.status);
  writeNotNull('page', instance.page);
  writeNotNull('page_size', instance.pageSize);
  writeNotNull('sort_key', instance.sortKey);
  writeNotNull('sort_order', _$SortOrderEnumMap[instance.sortOrder]);
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
