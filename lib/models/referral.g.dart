// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Referral _$ReferralFromJson(Map<String, dynamic> json) => Referral(
      id: json['id'] as int,
      fullName: json['full_name'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      voucherCode: json['voucher_code'] as String,
      status: json['status'] as int,
      nominator: Alumni.fromJson(json['nominator'] as Map<String, dynamic>),
      voucher: Voucher.fromJson(json['voucher'] as Map<String, dynamic>),
      major: Major.fromJson(json['major'] as Map<String, dynamic>),
      university:
          University.fromJson(json['university'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReferralToJson(Referral instance) => <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'phone': instance.phone,
      'address': instance.address,
      'voucher_code': instance.voucherCode,
      'status': instance.status,
      'nominator': instance.nominator.toJson(),
      'voucher': instance.voucher.toJson(),
      'major': instance.major.toJson(),
      'university': instance.university.toJson(),
    };
