import 'package:uni_alumni/shared/data/event_enum.dart';

class EventRequest {
  String? eventName;
  String? eventContent;
  String? location;
  DateTime? registrationStartDate;
  DateTime? registrationEndDate;
  DateTime? startDate;
  DateTime? endDate;
  int? groupId;
  int? alumniId;
  EventStatus? status;
  int? page;
  int? pageSize;
  EventSortKey? sortKey;
  SortOrder? sortOrder;

  EventRequest(
      {this.eventName = '',
      this.eventContent = '',
      this.location = '',
      this.registrationStartDate,
      this.registrationEndDate,
      this.startDate,
      this.endDate,
      this.groupId,
      this.alumniId,
      this.status,
      this.page,
      this.pageSize = 10,
      this.sortKey,
      this.sortOrder});

  Map<String, dynamic> toJson() => {
        'eventName': eventName,
        'eventContent': eventContent,
        'location': location,
        'registrationStartDate': registrationEndDate == null
            ? ''
            : registrationEndDate!.toIso8601String(),
        'registrationEndDate': registrationEndDate == null
            ? ''
            : registrationEndDate!.toIso8601String(),
        'startDate': startDate == null ? '' : startDate!.toIso8601String(),
        'endDate': endDate == null ? '' : endDate!.toIso8601String(),
        'groupId': groupId == null ? '' : groupId.toString(),
        'alumniId': alumniId == null ? '' : alumniId.toString(),
        'status': status == null ? '' : EventEnum.getStatus(status!),
        // 'page': page == null ? '' : page.toString(),
        'page-size': pageSize.toString(),
        // 'sort-key': sortKey == null ? '' : EventEnum.getEventSortKey(sortKey!),
        'sort-order':
            sortOrder == null ? '' : EventEnum.getSortOrder(sortOrder!),
      };
}
