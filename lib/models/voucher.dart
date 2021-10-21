
import 'package:json_annotation/json_annotation.dart';

import 'major.dart';

part 'voucher.g.dart';

@JsonSerializable(includeIfNull: false)
class Voucher{
  @JsonKey(name : 'create_date', ignore: true)
  DateTime? createDate;

  @JsonKey(name:'status', ignore: true)
  String? status;

  @JsonKey(name:'id')
  late int id;

  @JsonKey(name:'discount_value')
  late double discountValue;

  @JsonKey(name:'major')
  late Major major;

  @JsonKey(name:'relationship_name')
  late String relationshipName;



  Voucher({
    required this.id,
    required this.relationshipName,
    required this.discountValue,
    required this.major,
    this.status,
});

  factory Voucher.fromJson(Map<String, dynamic> json) => _$VoucherFromJson(json);
  Map<String, dynamic> toJson() => _$VoucherToJson(this);

}