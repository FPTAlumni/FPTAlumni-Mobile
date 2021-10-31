

import 'package:json_annotation/json_annotation.dart';
part 'referral_post_request.g.dart';

@JsonSerializable(includeIfNull: false)
class ReferralPostRequest{

  int? id;
  int? status;
  @JsonKey(name:'full_name')
  String? fullName;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name:'address')
  String? address;
  @JsonKey(name:'nominator_id')
  int? nominatorId;
  @JsonKey(name:'voucher_id')
  int? voucherId;

  @JsonKey(name:'parent_name')
  String? parentName;
  @JsonKey(name:'parent_phone')
  String? parentPhone;
  @JsonKey(name:'high_school_name')
  String? highSchoolName;

  ReferralPostRequest({this.id, this.status, this.fullName, this.phone, this.address, this.nominatorId,
      this.voucherId, this.parentName, this.parentPhone, this.highSchoolName});

  Map<String, dynamic> toJson() => _$ReferralPostRequestToJson(this);
}

