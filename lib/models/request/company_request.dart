


import 'package:json_annotation/json_annotation.dart';
import 'package:uni_alumni/shared/data/enum/common_enum.dart';


part 'company_request.g.dart';

@JsonSerializable(includeIfNull: false)
class CompanyRequest{

  @JsonKey(name: 'company-name')
  String? companyName;
  @JsonKey(name:'location')
  String? location;
  @JsonKey(name:'business')
  String? business;
  @JsonKey(name:'page')
  String? page;
  @JsonKey(name:'page-size', defaultValue : '50')
  String? pageSize;
  @JsonKey(name:'sort-key')
  String? sortKey;
  @JsonKey(name:'sort-order')
  SortOrder? sortOrder;

  CompanyRequest({this.companyName, this.location, this.business, this.page,
      this.pageSize, this.sortKey, this.sortOrder});

  Map<String, dynamic> toJson() =>  _$CompanyRequestToJson(this);
}

