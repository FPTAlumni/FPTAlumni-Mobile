import 'package:json_annotation/json_annotation.dart';
import 'package:uni_alumni/models/alumni.dart';
import 'package:uni_alumni/models/company.dart';
import 'package:uni_alumni/models/group.dart';

import 'major.dart';

part 'recruitment.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class Recruitment {
  @JsonValue("title")
  String? title;

  @JsonValue("description")
  String? description;

  @JsonValue("position")
  String? position;

  @JsonValue("type")
  String? type;

  @JsonValue("status")
  String? status;

  @JsonValue("experience_level")
  String? experienceLevel;

  @JsonValue("phone")
  String? phone;

  @JsonValue("email")
  String? email;

  @JsonValue("end_date")
  DateTime? endDate;

  @JsonValue("created_date")
  DateTime? createdDate;

  @JsonValue("alumni")
  Alumni? alumni;

  @JsonValue("group")
  Group? group;

  @JsonValue("company")
  Company? company;

  @JsonValue("group_origin")
  Group? groupOrigin;

  @JsonValue("major")
  Major? major;

  Recruitment(
      {this.major,
      this.alumni,
      this.endDate,
      this.phone,
      this.email,
      this.createdDate,
      this.position,
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
}
