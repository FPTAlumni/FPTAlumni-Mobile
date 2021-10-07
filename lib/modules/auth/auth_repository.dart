import 'package:uni_alumni/api/api_provider.dart';
import 'package:uni_alumni/models/request/app_token_request.dart';

class AuthRepository {
  final ApiProvider apiProvider;

  AuthRepository({required this.apiProvider});

  Future<String?> getAppToken(AppTokenRequest data) async {
    final response = await apiProvider.getAppToken('/login', data);
    final responseStatusCode = response.statusCode;
    switch (responseStatusCode) {
      case 200:
        return response.body['custom_token'];
      case 201:
        return null;
    }
  }
}
