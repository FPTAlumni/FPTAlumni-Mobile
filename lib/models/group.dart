import 'package:json_annotation/json_annotation.dart';
import 'package:uni_alumni/models/alumni.dart';
import 'package:uni_alumni/models/university.dart';

part 'group.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class Group {
  static const String notRequest = 'Not Requested';
  static const String pending = 'Pending';

  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "banner")
  String? banner;

  @JsonKey(name: "group_name")
  String? groupName;

  @JsonKey(name: "registered_date")
  DateTime? registrationDate;

  @JsonKey(name: "created_date")
  DateTime? createdDate;

  @JsonKey(name: "request_status")
  String? requestStatus;

  @JsonKey(name: "number_of_members")
  int? numberOfMembers;

  @JsonKey(name: "group_leader")
  Alumni? leader;

  @JsonKey(name: "university")
  University? university;

  @JsonKey(ignore: true)
  int? status;

  Group({
    this.requestStatus,
    this.createdDate,
    this.id,
    this.university,
    this.banner,
    this.groupName,
    this.leader,
    this.numberOfMembers,
    this.registrationDate,
  }) {
    setStatus();
  }

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  Map<String, dynamic> toJson() => _$GroupToJson(this);

  @override
  String toString() {
    return '$groupName';
  }

  bool isEqual(Group? model) {
    return this.id == model?.id;
  }

  setStatus() {
    if (requestStatus == notRequest) {
      status = -1;
    } else if (requestStatus == pending) {
      status = 0;
    } else {
      status = 1;
    }
  }
}
