import 'package:json_annotation/json_annotation.dart';

enum GroupStatus {
  @JsonValue("Active")
  active,
  @JsonValue("Inactive")
  inActive,
}

enum GroupSortKey {
  @JsonValue("CreatedDate")
  createdDate,
  @JsonValue("GroupName")
  groupName,
  @JsonValue("Status")
  status,
}
