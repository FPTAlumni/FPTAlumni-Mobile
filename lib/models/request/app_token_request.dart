import 'package:json_annotation/json_annotation.dart';

part 'app_token_request.g.dart';

@JsonSerializable(includeIfNull: false)
class AppTokenRequest {
  @JsonKey(name: 'token')
  String tokenId; //firebase token

  @JsonKey(name: 'university_id')
  int universityId;

  AppTokenRequest({required this.tokenId, required this.universityId});

  Map<String, dynamic> toJson() => _$AppTokenRequestToJson(this);
}
