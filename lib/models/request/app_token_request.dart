import 'package:json_annotation/json_annotation.dart';

part 'app_token_request.g.dart';

@JsonSerializable(includeIfNull: false)
class AppTokenRequest {
  @JsonKey(name: 'token')
  String tokenId; //firebase token

  AppTokenRequest({required this.tokenId});

  Map<String, dynamic> toJson() => _$AppTokenRequestToJson(this);
}
