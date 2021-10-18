import 'package:json_annotation/json_annotation.dart';
import 'package:uni_alumni/models/alumni.dart';
import 'package:uni_alumni/models/university.dart';

part 'group.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class Group {
  @JsonValue("id")
  int? id;

  @JsonValue("banner")
  String? banner;

  @JsonValue("group_name")
  String? groupName;

  @JsonValue("registered_date")
  DateTime? registrationDate;

  @JsonValue("created_date")
  DateTime? createdDate;

  @JsonValue("status")
  int? status;

  @JsonValue("number_of_members")
  int? numberOfMembers;

  @JsonValue("group_leader")
  Alumni? leader;

  @JsonValue("university")
  University? university;

  Group({
    this.status,
    this.createdDate,
    this.id,
    this.university,
    this.banner,
    this.groupName,
    this.leader,
    this.numberOfMembers,
    this.registrationDate,
  });

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  Map<String, dynamic> toJson() => _$GroupToJson(this);
}
