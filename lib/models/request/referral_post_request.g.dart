// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral_post_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReferralPostRequest _$ReferralPostRequestFromJson(Map<String, dynamic> json) =>
    ReferralPostRequest(
      id: json['id'] as int?,
      status: json['status'] as int?,
      fullName: json['full_name'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      nominatorId: json['nominator_id'] as int?,
      voucherId: json['voucher_id'] as int?,
      parentName: json['parent_name'] as String?,
      parentPhone: json['parent_phone'] as String?,
      highSchoolName: json['high_school_name'] as String?,
    );

Map<String, dynamic> _$ReferralPostRequestToJson(ReferralPostRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('status', instance.status);
  writeNotNull('full_name', instance.fullName);
  writeNotNull('phone', instance.phone);
  writeNotNull('address', instance.address);
  writeNotNull('nominator_id', instance.nominatorId);
  writeNotNull('voucher_id', instance.voucherId);
  writeNotNull('parent_name', instance.parentName);
  writeNotNull('parent_phone', instance.parentPhone);
  writeNotNull('high_school_name', instance.highSchoolName);
  return val;
}
