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
      parentName: json['parent_name'] as String?,
      parentPhone: json['parent_phone'] as String?,
      highSchoolName: json['high_school_name'] as String?,
    );

Map<String, dynamic> _$ReferralToJson(Referral instance) {
  final val = <String, dynamic>{
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

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('parent_name', instance.parentName);
  writeNotNull('parent_phone', instance.parentPhone);
  writeNotNull('high_school_name', instance.highSchoolName);
  return val;
}
