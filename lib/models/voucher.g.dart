// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Voucher _$VoucherFromJson(Map<String, dynamic> json) => Voucher(
      id: json['id'] as int,
      relationshipName: json['relationship_name'] as String,
      discountValue: (json['discount_value'] as num).toDouble(),
      major: Major.fromJson(json['major'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VoucherToJson(Voucher instance) => <String, dynamic>{
      'id': instance.id,
      'discount_value': instance.discountValue,
      'major': instance.major,
      'relationship_name': instance.relationshipName,
    };
