import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

@JsonSerializable(includeIfNull: false)
class Company {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'company_name')
  String companyName;

  @JsonKey(name: 'location')
  String location;

  @JsonKey(name: 'business')
  String business;

  @JsonKey(name: 'description')
  String? description;

  Company(
      {required this.id,
      required this.companyName,
      required this.location,
      required this.business,
      this.description});

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
