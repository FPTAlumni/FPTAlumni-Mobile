import 'package:json_annotation/json_annotation.dart';

part 'app_token_response.g.dart';

@JsonSerializable(includeIfNull: false)
class AppTokenResponse {
  @JsonKey(name: 'custom_token')
  String appToken; //token generated by backend

  @JsonKey(name: 'id')
  int id; //user id in db

  AppTokenResponse({required this.appToken, required this.id});

  factory AppTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$AppTokenResponseFromJson(json);
}
