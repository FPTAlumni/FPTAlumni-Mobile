import 'package:json_annotation/json_annotation.dart';

part 'alumni_group_request.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class AlumniGroupRequest {
  @JsonKey(name: 'id')
  String groupId;
  @JsonKey(name: 'email')
  String? email;

  AlumniGroupRequest({
    required this.groupId,
    this.email,
  });

  Map<String, dynamic> toJson() => _$AlumniGroupRequestToJson(this);
}
