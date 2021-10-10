import 'package:json_annotation/json_annotation.dart';

enum SortOrder {
  @JsonValue('DESC')
  DESC,
  @JsonValue('ASC')
  ASC,
}
