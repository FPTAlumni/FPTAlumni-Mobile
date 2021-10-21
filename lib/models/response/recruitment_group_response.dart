import 'package:json_annotation/json_annotation.dart';

part 'recruitment_group_response.g.dart';

@JsonSerializable()
class RecruitmentGroupResponse {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "banner")
  String? banner;

  @JsonKey(name: "group_name")
  String? groupName;

  RecruitmentGroupResponse({
    this.id,
    this.banner,
    this.groupName,
  });

  factory RecruitmentGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$RecruitmentGroupResponseFromJson(json);

  @override
  String toString() {
    return '$groupName';
  }

  bool isEqual(RecruitmentGroupResponse? model) {
    return this.id == model?.id;
  }
}
