import 'package:uni_alumni/api/api_provider.dart';
import 'package:uni_alumni/models/request/user_request.dart';

class AuthRepository {
  final ApiProvider apiProvider;

  AuthRepository({required this.apiProvider});

  Future<String?> getAppToken(UserRequest data) async {
    print(data.toJson().toString());
    final response = await apiProvider.getAppToken('/login', data);
    print(response.statusCode);
    print(response.body);
  }
}
