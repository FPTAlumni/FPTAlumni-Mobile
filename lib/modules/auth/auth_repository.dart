import 'dart:io';

import 'package:uni_alumni/api/api_provider.dart';
import 'package:uni_alumni/models/request/app_token_request.dart';
import 'package:uni_alumni/models/request/registration_request.dart';
import 'package:uni_alumni/models/response/app_token_response.dart';
import 'package:uni_alumni/models/alumni.dart';

class AuthRepository {
  final ApiProvider apiProvider;

  AuthRepository({required this.apiProvider});

  Future<AppTokenResponse?> getAppToken(AppTokenRequest data) async {
    final response = await apiProvider.getAppToken('/login', data);
    final responseStatusCode = response.statusCode;
    print(response.statusCode);
    switch (responseStatusCode) {
      case 200:
        return AppTokenResponse.fromJson(response.body);
      case 201:
        return null;
      case 404:
        throw HttpException('Cannot connect to server');
    }
  }

  Future<bool> register(RegistrationRequest data) async {
    final response = await apiProvider.register('/alumnus', data);
    if (response.statusCode == 404) return false;
    return true;
  }

  Future<Alumni?> getUserById(int id, String token) async {
    final response = await apiProvider.getMethod('/alumnus/$id', token);
    if (response.statusCode == 200) {
      return Alumni.fromJson(response.body['data']);
    }
  }
}
