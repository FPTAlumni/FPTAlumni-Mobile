

import 'package:json_annotation/json_annotation.dart';
import 'package:uni_alumni/shared/data/enum/common_enum.dart';

part 'referral_request.g.dart';

@JsonSerializable(includeIfNull: false)
class ReferralRequest {

  @JsonKey(name:'nominatorId')
  String? nominatorId;
  @JsonKey(name:'majorId')
  int? majorId;
  @JsonKey(name:'status')
  String? status;
  @JsonKey(name:'page')
  String? page;
  @JsonKey(name:'page-size', defaultValue: '10')
  String? pageSize;
  @JsonKey(name:'sort-key')
  String? sortKey;
  @JsonKey(name:'sort-order')
  SortOrder? sortOrder;

  ReferralRequest({
    this.nominatorId,
    this.majorId,
    this.status,
    this.page,
    this.pageSize,
    this.sortKey,
    this.sortOrder
  });

  Map<String, dynamic> toJson() => _$ReferralRequestToJson(this);

}