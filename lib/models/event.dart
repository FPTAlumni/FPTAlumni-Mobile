import 'package:json_annotation/json_annotation.dart';
import 'package:uni_alumni/shared/utils/format_utils.dart';

part 'event.g.dart';

@JsonSerializable(includeIfNull: false)
class Event {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'event_name')
  String eventName;

  @JsonKey(name: 'event_content')
  String eventContent;

  @JsonKey(name: 'banner')
  String banner;

  @JsonKey(name: 'location')
  String location;

  @JsonKey(name: 'registration_start_date')
  DateTime registrationStartDate;

  @JsonKey(name: 'registration_end_date')
  DateTime registrationEndDate;

  @JsonKey(name: 'start_date')
  DateTime startDate;

  @JsonKey(name: 'end_date')
  DateTime endDate;

  @JsonKey(name: 'group_id')
  int groupId;

  Event({
    required this.id,
    required this.eventContent,
    required this.location,
    required this.banner,
    required this.eventName,
    required this.startDate,
    required this.endDate,
    required this.groupId,
    required this.registrationStartDate,
    required this.registrationEndDate,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}
