
import 'package:json_annotation/json_annotation.dart';
import 'package:uni_alumni/models/company.dart';

part 'alumni_request.g.dart';

@JsonSerializable(includeIfNull: false)
class AlumniRequest {

  @JsonKey(name : 'id')
  int? id;

  @JsonKey(name: 'phone')
  String? phone;

  @JsonKey(name: 'full_name')
  String? fullName;

  @JsonKey(name: 'address')
  String? address;

  @JsonKey(name:'dob')
  DateTime? dob;

  @JsonKey(name:'job')
  String? job;

  @JsonKey(name:'about_me')
  String? aboutMe;

  @JsonKey(name: 'company_id')
  int? companyId;

  @JsonKey(name:'major_id')
  int? majorId;

  @JsonKey(name:'class_id')
  int? classId;

  @JsonKey(name:'image')
  String? image;

  AlumniRequest({this.id, this.phone, this.fullName, this.address, this.dob,
      this.job, this.aboutMe, this.companyId, this.majorId, this.classId,
      this.image});

  Map<String, dynamic> toJson() => _$AlumniRequestToJson(this);


}

