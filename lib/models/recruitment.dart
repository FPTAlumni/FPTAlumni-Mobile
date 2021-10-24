import 'package:json_annotation/json_annotation.dart';
import 'package:uni_alumni/models/alumni.dart';
import 'package:uni_alumni/models/company.dart';
import 'package:uni_alumni/models/group.dart';

import 'major.dart';

part 'recruitment.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class Recruitment {
  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "position")
  String? position;

  @JsonKey(name: "string_type")
  String? type;

  @JsonKey(name: "string_status")
  String? stringStatus;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "experience_level")
  String? experienceLevel;

  @JsonKey(name: "phone")
  String? phone;

  @JsonKey(name: "email")
  String? email;

  @JsonKey(name: "end_date")
  DateTime? endDate;

  @JsonKey(name: "created_date")
  DateTime? createdDate;

  @JsonKey(name: "alumni")
  Alumni? alumni;

  @JsonKey(name: "group")
  Group? group;

  @JsonKey(name: "company")
  Company? company;

  @JsonKey(name: "group_origin")
  Group? groupOrigin;

  @JsonKey(name: "major")
  Major? major;

  Recruitment(
      {this.major,
      this.alumni,
      this.endDate,
      this.phone,
      this.email,
      this.createdDate,
      this.position,
      this.stringStatus,
      this.status,
      this.type,
      this.company,
      this.description,
      this.title,
      this.group,
      this.experienceLevel,
      this.groupOrigin});

  factory Recruitment.fromJson(Map<String, dynamic> json) =>
      _$RecruitmentFromJson(json);

  String get typeString {
    if (this.type!.contains("Fulltime")) {
      return "Full-time";
    } else {
      return "Part-time";
    }
  }
}
