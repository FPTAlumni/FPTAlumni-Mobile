import 'package:get/get_connect/connect.dart';
import 'package:uni_alumni/api/base_provider.dart';
import 'package:uni_alumni/models/request/user_request.dart';

class ApiProvider extends BaseProvider {
  Future<Response> getUniversities(String path) {
    return get(path);
  }

  //get app token from backend
  Future<Response> getAppToken(String path, UserRequest data) {
    return post(path, "", query: data.toJson());
  }
}
