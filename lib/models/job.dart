


import 'package:json_annotation/json_annotation.dart';
part 'job.g.dart';

@JsonSerializable(includeIfNull: false)
class Job{
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'company_name')
  String companyName;

  @JsonKey(name: 'location')
  String location;


  @JsonKey(name: 'business')
  String business;

  @JsonKey(name: 'description')
  String description;

  Job({
    required this.id,
    required this.companyName,
    required this.location,
    required this.business,
    required this.description,
});

  factory Job.fromJson(Map<String,dynamic> json) => _$JobFromJson(json);
  Map<String, dynamic> toJson() => _$JobToJson(this);

}


