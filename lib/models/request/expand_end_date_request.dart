import 'package:json_annotation/json_annotation.dart';

part 'expand_end_date_request.g.dart';

@JsonSerializable(includeIfNull: false)
class ExpandEndDateRequest {
  @JsonKey(name: 'id')
  int jobId;

  @JsonKey(name: "end_date")
  DateTime endDate;

  ExpandEndDateRequest({required this.jobId, required this.endDate});

  Map<String, dynamic> toJson() => _$ExpandEndDateRequestToJson(this);
}
