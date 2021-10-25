
import 'package:json_annotation/json_annotation.dart';
import 'package:uni_alumni/models/university.dart';
import 'package:uni_alumni/models/voucher.dart';

import 'alumni.dart';
import 'major.dart';

part 'referral.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class Referral{

  @JsonKey(name : 'id')
  late int id;
  @JsonKey(name : 'full_name')
  late String fullName;
  @JsonKey(name: 'phone')
  late String phone;
  @JsonKey(name: 'address')
  late String address;
  @JsonKey(name: 'voucher_code')
  late String voucherCode;
  @JsonKey(name: 'create_date', ignore: true)
  DateTime? createdDate;
  @JsonKey(name: 'status')
  late int status;
  @JsonKey(name: 'nominator')
  late Alumni nominator;
  @JsonKey(name: 'voucher')
  late  Voucher voucher;
  @JsonKey(name: 'major')
  late Major major;
  @JsonKey(name: 'university')
  late University university;

  Referral({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.address,
    required this.voucherCode,
    this.createdDate,
    required this.status,
    required this.nominator,
    required this.voucher,
    required this.major,
    required this.university,
});

  factory Referral.fromJson(Map<String, dynamic> json) => _$ReferralFromJson(json);
  Map<String, dynamic> toJson() => _$ReferralToJson(this);


}