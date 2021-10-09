// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_token_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppTokenRequest _$AppTokenRequestFromJson(Map<String, dynamic> json) =>
    AppTokenRequest(
      tokenId: json['token'] as String,
      universityId: json['university_id'] as int,
    );

Map<String, dynamic> _$AppTokenRequestToJson(AppTokenRequest instance) =>
    <String, dynamic>{
      'token': instance.tokenId,
      'university_id': instance.universityId,
    };
