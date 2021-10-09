// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppTokenResponse _$AppTokenResponseFromJson(Map<String, dynamic> json) =>
    AppTokenResponse(
      appToken: json['custom_token'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$AppTokenResponseToJson(AppTokenResponse instance) =>
    <String, dynamic>{
      'custom_token': instance.appToken,
      'id': instance.id,
    };
