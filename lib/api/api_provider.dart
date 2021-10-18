import 'package:get/get_connect/connect.dart';
import 'package:uni_alumni/api/base_provider.dart';
import 'package:uni_alumni/models/request/app_token_request.dart';
import 'package:uni_alumni/models/request/event_request.dart';
import 'package:uni_alumni/models/request/registration_request.dart';
import 'package:uni_alumni/shared/utils/header.dart';

class ApiProvider extends BaseProvider {
  //------------University------------
  Future<Response> getUniversities(String path) {
    return get(path);
  }

  //------------Class------------
  Future<Response> getClasses(String path) {
    return get(path);
  }

  //------------Major------------
  Future<Response> getMajorsById(String path, int classId) {
    return get(path, query: {'classId': classId.toString()});
  }

  //------------Authentication------------
  //get app token from backend
  Future<Response> getAppToken(String path, AppTokenRequest data) {
    return post(path, data.toJson());
  }

  Future<Response> register(String path, RegistrationRequest data) {
    return post(path, data.toJson());
  }

  //------------Alumni------------
  Future<Response> getUserById(String path, String token) {
    return get(path, headers: HeaderApi(token).getHeaders());
  }

  Future<Response> joinEvent(String path, String token) {
    return post(path, {}, headers: HeaderApi(token).getHeaders());
  }

  Future<Response> leaveEvent(String path, String token) {
    return delete(path, headers: HeaderApi(token).getHeaders());
  }

  //------------Event------------
  Future<Response> getEvents(String path, String token, EventRequest params) {
    return get(path,
        headers: HeaderApi(token).getHeaders(), query: params.toJson());
  }

  //------------Group------------
  Future<Response> getGroupById(String path, String token) {
    return get(path, headers: HeaderApi(token).getHeaders());
  }
}
