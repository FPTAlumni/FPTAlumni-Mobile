

import 'package:json_annotation/json_annotation.dart';

enum ReferralStatus{
  @JsonValue('Inactive')
  Inactive,
  @JsonValue('Active')
  Active,
  @JsonValue('Paid')
  Paid
}