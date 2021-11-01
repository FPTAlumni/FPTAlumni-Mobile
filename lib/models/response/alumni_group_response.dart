import 'package:json_annotation/json_annotation.dart';
import 'package:uni_alumni/models/alumni.dart';

part 'alumni_group_response.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class AlumniGroupResponse {
  @JsonKey(name: 'alumni')
  Alumni? alumni;

  @JsonKey(name: 'group_id')
  int? groupId;

  @JsonKey(name: 'registered_date')
  DateTime? registeredDate;

  @JsonKey(name: 'status')
  String? status;

  AlumniGroupResponse({
    this.status,
    this.groupId,
    this.alumni,
    this.registeredDate,
  });

  factory AlumniGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$AlumniGroupResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AlumniGroupResponseToJson(this);
}
