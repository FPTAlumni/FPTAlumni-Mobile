import 'package:json_annotation/json_annotation.dart';

enum AlumniStatus {
  @JsonValue('Reject')
  reject,
  @JsonValue('Pending')
  pending,
  @JsonValue('Active')
  active,
  @JsonValue('Deactive')
  deactive,
}
