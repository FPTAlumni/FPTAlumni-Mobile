import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uni_alumni/shared/constants/colors.dart';
import 'package:uni_alumni/shared/data/enum/event_enum.dart';

part 'event.g.dart';

@JsonSerializable(includeIfNull: false)
class Event {
  static const String notOpen = "Not Open";
  static const String registrationOpen = "Registration Open";
  static const String registered = "Registered";
  static const String registrationEnd = "Registration Closed";
  static const String starting = "Starting";
  static const String ended = "Ended";

  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'event_name')
  late String eventName;

  @JsonKey(name: 'event_content')
  late String eventContent;

  @JsonKey(name: 'banner')
  late String banner;

  @JsonKey(name: 'location')
  late String location;

  @JsonKey(name: 'registration_start_date')
  late DateTime registrationStartDate;

  @JsonKey(name: 'registration_end_date')
  late DateTime registrationEndDate;

  @JsonKey(name: 'start_date')
  late DateTime startDate;

  @JsonKey(name: 'end_date')
  late DateTime endDate;

  @JsonKey(name: 'group_id')
  late int groupId;

  @JsonKey(name: 'group_name')
  String? groupName;

  @JsonKey(name: 'created_date')
  late DateTime createdDate;

  @JsonKey(name: 'in_event')
  late bool inEvent;

  @JsonKey(ignore: true)
  String? eventStatus = "";

  @JsonKey(ignore: true)
  Color statusColor = Color(0xFFEEEEEE);

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
    required this.inEvent,
    required this.createdDate,
    this.groupName,
  }) {
    setStatus();
  }

  Event.empty() {
    this.id = -1;
    this.eventContent = '';
    this.location = '';
    this.banner = '';
    this.eventName = '';
    this.startDate = DateTime.now();
    this.endDate = DateTime.now();
    this.groupId = 0;
    this.registrationStartDate = DateTime.now();
    this.registrationEndDate = DateTime.now();
    this.inEvent = false;
  }

  EventStatusFrontEnd _getEventStatus(bool isRegistered) {
    final DateTime now = DateTime.now().toUtc();

    if (now.isBefore(registrationStartDate)) {
      return EventStatusFrontEnd.registerIsNotOpen;
    }

    if (now.isBefore(registrationEndDate)) {
      if (isRegistered) {
        return EventStatusFrontEnd.registered;
      }
      return EventStatusFrontEnd.registering;
    }

    if (now.isBefore(startDate)) {
      return EventStatusFrontEnd.registrationEnd;
    }

    if (now.isBefore(endDate)) {
      return EventStatusFrontEnd.starting;
    }

    return EventStatusFrontEnd.end;
  }

  void setStatus() {
    EventStatusFrontEnd status = _getEventStatus(inEvent);
    switch (status) {
      case EventStatusFrontEnd.registerIsNotOpen:
        eventStatus = notOpen;
        statusColor = Colors.grey;
        break;
      case EventStatusFrontEnd.registering:
        eventStatus = registrationOpen;
        statusColor = ColorConstants.primaryAppColor;
        break;
      case EventStatusFrontEnd.registered:
        eventStatus = registered;
        statusColor = ColorConstants.primaryAppColor;
        break;
      case EventStatusFrontEnd.registrationEnd:
        eventStatus = registrationEnd;
        statusColor = Colors.grey;
        break;
      case EventStatusFrontEnd.starting:
        eventStatus = starting;
        statusColor = Colors.green;
        break;
      case EventStatusFrontEnd.end:
        eventStatus = ended;
        statusColor = Colors.grey;
        break;
    }
  }

  joinEvent() {
    inEvent = true;
    setStatus();
  }

  leaveEvent() {
    inEvent = false;
    setStatus();
  }

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}
