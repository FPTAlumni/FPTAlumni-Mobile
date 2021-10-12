import 'package:json_annotation/json_annotation.dart';
import 'package:uni_alumni/shared/data/enum/common_enum.dart';
import 'package:uni_alumni/shared/data/enum/event_enum.dart';

part 'event_request.g.dart';

@JsonSerializable(includeIfNull: false)
class EventRequest {
  @JsonKey(name: 'eventName')
  String? eventName;

  @JsonKey(name: 'eventContent')
  String? eventContent;

  @JsonKey(name: 'location')
  String? location;

  @JsonKey(name: 'registrationStartDate')
  DateTime? registrationStartDate;

  @JsonKey(name: 'registrationEndDate')
  DateTime? registrationEndDate;

  @JsonKey(name: 'startDate')
  DateTime? startDate;

  @JsonKey(name: 'endDate')
  DateTime? endDate;

  @JsonKey(name: 'groupId')
  String? groupId;

  @JsonKey(name: 'alumniId')
  String? alumniId;

  @JsonKey(name: 'status')
  EventStatus? status;

  @JsonKey(name: 'page')
  String? page;

  @JsonKey(name: 'page-size', defaultValue: '10')
  String? pageSize;

  @JsonKey(name: 'sort-key')
  EventSortKey? sortKey;

  @JsonKey(name: 'sort-order', defaultValue: SortOrder.DESC)
  SortOrder? sortOrder;

  EventRequest(
      {this.eventName,
      this.eventContent,
      this.location,
      this.registrationStartDate,
      this.registrationEndDate,
      this.startDate,
      this.endDate,
      this.groupId,
      this.alumniId,
      this.status,
      this.page,
      this.pageSize,
      this.sortKey,
      this.sortOrder});

  Map<String, dynamic> toJson() => _$EventRequestToJson(this);
}
