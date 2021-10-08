import 'package:uni_alumni/shared/utils/format_utils.dart';

class Event {
  int id;
  String eventName;
  String eventContent;
  String banner;
  String location;
  DateTime registrationStartDate;
  DateTime registrationEndDate;
  DateTime startDate;
  DateTime endDate;
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

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json['id'],
        eventName: json['event_name'],
        eventContent: json['event_content'],
        banner: json['banner'],
        location: json['location'],
        registrationStartDate: FormatUtils.fromddMMyyyyHHmmtoDateTime(
            json['registration_start_date']),
        registrationEndDate: FormatUtils.fromddMMyyyyHHmmtoDateTime(
            json['registration_end_date']),
        startDate: FormatUtils.fromddMMyyyyHHmmtoDateTime(json['start_date']),
        endDate: FormatUtils.fromddMMyyyyHHmmtoDateTime(json['end_date']),
        groupId: json['group_id'],
      );
}
