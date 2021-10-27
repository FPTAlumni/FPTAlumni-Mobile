
import 'package:json_annotation/json_annotation.dart';
import 'package:uni_alumni/shared/data/enum/common_enum.dart';
part 'voucher_get_request.g.dart';

@JsonSerializable(includeIfNull: false)
class VoucherRequest{

  @JsonKey(name:'major_id')
  String? majorId;
  @JsonKey(name:'status')
  String? status;
  @JsonKey(name:'page')
  String? page;
  @JsonKey(name:'page_size', defaultValue: '10')
  String? pageSize;
  @JsonKey(name:'sort_key')
  String? sortKey;
  @JsonKey(name:'sort_order')
  SortOrder? sortOrder;

  VoucherRequest({
    this.majorId,
    this.status,
    this.page,
    this.pageSize,
    this.sortKey,
    this.sortOrder
  });

  Map<String, dynamic> toJson() => _$VoucherRequestToJson(this);
}