import 'package:get/get_connect/connect.dart';
import 'package:uni_alumni/api/base_provider.dart';

class ApiProvider extends BaseProvider {
  Future<Response> getUniversities(String path) {
    return get(path);
  }
}
