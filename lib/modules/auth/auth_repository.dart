import 'package:uni_alumni/api/api_provider.dart';
import 'package:uni_alumni/models/request/app_token_request.dart';
import 'package:uni_alumni/models/request/registration_request.dart';
import 'package:uni_alumni/models/response/app_token_response.dart';
import 'package:uni_alumni/models/alumni_info.dart';

class AuthRepository {
  final ApiProvider apiProvider;

  AuthRepository({required this.apiProvider});

  Future<AppTokenResponse?> getAppToken(AppTokenRequest data) async {
    final response = await apiProvider.getAppToken('/login', data);
    final responseStatusCode = response.statusCode;
    switch (responseStatusCode) {
      case 200:
        return AppTokenResponse(
          appToken: response.body['custom_token'],
          id: response.body['id'],
        );
      case 201:
        return null;
    }
  }

  Future<bool> register(RegistrationRequest data) async {
    final response = await apiProvider.register('/alumnus', data);
    if (response.statusCode == 404) return false;
    return true;
  }

  Future<AlumniInfo?> getUserById(int id, String token) async {
    final response = await apiProvider.getUserById('/alumnus/$id', token);
    if (response.statusCode == 200) {
      return AlumniInfo.fromJson(response.body['data']);
    }
  }
}
