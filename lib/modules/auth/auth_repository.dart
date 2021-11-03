import 'dart:io';

import 'package:uni_alumni/api/api_provider.dart';
import 'package:uni_alumni/models/request/app_token_request.dart';
import 'package:uni_alumni/models/request/registration_request.dart';
import 'package:uni_alumni/models/response/app_token_response.dart';
import 'package:uni_alumni/models/alumni.dart';

class AuthRepository {
  final ApiProvider apiProvider;

  static const pendingErrorMsg = 'Cannot connect to your account';

  AuthRepository({required this.apiProvider});

  Future<AppTokenResponse?> getAppToken(AppTokenRequest data) async {
    final response = await apiProvider.getAppToken('/login', data);
    final responseStatusCode = response.statusCode;
    switch (responseStatusCode) {
      case 200:
        return AppTokenResponse.fromJson(response.body);
      case 201:
        return null;
      case 401:
        throw HttpException(pendingErrorMsg);
      case 404:
        throw HttpException('Cannot connect to server');
    }
  }

  Future<bool> register(RegistrationRequest data) async {
    final response = await apiProvider.register('/alumnus', data);
    print(">>");
    print(response.statusText);
    print(response.statusCode);
    print(response.body.toString());
    if (response.isOk) return true;
    return false;
  }

  Future<Alumni?> getUserById(int id, String token) async {
    final response = await apiProvider.getMethod('/alumnus/$id', token);
    if (response.statusCode == 200) {
      return Alumni.fromJson(response.body['data']);
    }
  }
}
