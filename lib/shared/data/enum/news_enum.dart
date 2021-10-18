import 'package:json_annotation/json_annotation.dart';

enum NewsStatus {
  @JsonValue('Active')
  active,
  @JsonValue('Inactive')
  inactive,
}

enum NewsSort {
  @JsonValue('Title')
  title,
  @JsonValue('CreatedDate')
  createdDate,
  @JsonValue('status')
  status,
}
