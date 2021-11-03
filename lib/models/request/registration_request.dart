import 'package:json_annotation/json_annotation.dart';

part 'registration_request.g.dart';

@JsonSerializable(includeIfNull: false)
class RegistrationRequest {
  @JsonKey(name: 'uid')
  String uid; //uid get from firebase

  @JsonKey(name: 'phone')
  String phone;

  @JsonKey(name: 'full_name')
  String fullName;

  @JsonKey(name: 'address')
  String? address;

  @JsonKey(name: 'dob')
  DateTime dob;

  @JsonKey(name: 'job')
  String? job;

  @JsonKey(name: 'about_me')
  String? aboutMe;

  @JsonKey(name: 'company_id')
  int? companyId;

  @JsonKey(name: 'major_id')
  int? majorId;

  @JsonKey(name: 'class_id')
  int classId;

  RegistrationRequest({
    required this.uid,
    required this.phone,
    required this.fullName,
    required this.dob,
    required this.classId,
    this.address,
    this.aboutMe,
    this.companyId,
    this.job,
    this.majorId,
  });

  Map<String, dynamic> toJson() => _$RegistrationRequestToJson(this);
}
