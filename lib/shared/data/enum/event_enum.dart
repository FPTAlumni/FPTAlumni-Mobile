import 'package:json_annotation/json_annotation.dart';

enum EventSortKey {
  @JsonValue('EventName')
  eventName,
  @JsonValue('Location')
  location,
  @JsonValue('RegistrationStartDate')
  registrationStartDate,
  @JsonValue('RegistrationEndDate')
  registrationEndDate,
  @JsonValue('StartDate')
  startDate,
  @JsonValue('EndDate')
  endDate,
}

enum EventStatus {
  @JsonValue('NotStart')
  notStart,
  @JsonValue('RegistrationStart')
  registrationStart,
  @JsonValue('RegistrationEnd')
  registrationEnd,
  @JsonValue('InProgress')
  inProgress,
  @JsonValue('End')
  end,
  @JsonValue('Delete')
  delete,
}

enum EventStatusFrontEnd {
  registerIsNotOpen,
  registering,
  registered,
  registrationEnd,
  starting,
  end,
}
