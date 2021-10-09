enum SortOrder {
  DESC,
  ASC,
}

enum EventSortKey {
  eventName,
  location,
  registrationStartDate,
  registrationEndDate,
  endDate,
}

enum EventStatus {
  notStart,
  registrationStart,
  registrationEnd,
  inProgress,
  end,
  delete,
}

class EventEnum {
  static String getSortOrder(SortOrder sort) {
    switch (sort) {
      case SortOrder.ASC:
        return 'ASC';
      case SortOrder.DESC:
        return 'DESC';
      default:
        return '';
    }
  }

  static String getEventSortKey(EventSortKey eventSortKey) {
    switch (eventSortKey) {
      case EventSortKey.eventName:
        return 'EventName';
      case EventSortKey.location:
        return 'Location';
      case EventSortKey.registrationStartDate:
        return 'RegistrationStartDate';
      case EventSortKey.registrationEndDate:
        return 'RegistrationEndDate';
      case EventSortKey.endDate:
        return 'EndDate';
      default:
        return '';
    }
  }

  static String getStatus(EventStatus eventStatus) {
    switch (eventStatus) {
      case EventStatus.notStart:
        return 'NotStart';
      case EventStatus.registrationStart:
        return 'RegistrationStart';
      case EventStatus.registrationEnd:
        return 'RegistrationEnd';
      case EventStatus.inProgress:
        return 'InProgress';
      case EventStatus.end:
        return 'End';
      case EventStatus.delete:
        return 'Delete';
      default:
        return '';
    }
  }
}
