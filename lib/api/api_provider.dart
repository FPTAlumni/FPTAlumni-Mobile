import 'package:get/get_connect/connect.dart';
import 'package:uni_alumni/api/base_provider.dart';
import 'package:uni_alumni/models/request/alumni_group_request.dart';
import 'package:uni_alumni/models/request/alumni_request.dart';
import 'package:uni_alumni/models/request/app_token_request.dart';
import 'package:uni_alumni/models/request/company_request.dart';
import 'package:uni_alumni/models/request/event_request.dart';
import 'package:uni_alumni/models/request/expand_end_date_request.dart';
import 'package:uni_alumni/models/request/group_request.dart';
import 'package:uni_alumni/models/request/news_request.dart';
import 'package:uni_alumni/models/request/recruitment_get_request.dart';
import 'package:uni_alumni/models/request/recruitment_post_request.dart';
import 'package:uni_alumni/models/request/referral_post_request.dart';
import 'package:uni_alumni/models/request/referral_request.dart';
import 'package:uni_alumni/models/request/registration_request.dart';
import 'package:uni_alumni/models/request/voucher_get_request.dart';
import 'package:uni_alumni/shared/utils/header.dart';

class ApiProvider extends BaseProvider {
  Future<Response> deleteMethod(String path, String token) {
    return delete(path, headers: HeaderApi(token).getHeaders());
  }

  Future<Response> getMethod(String path, String token) {
    return get(path, headers: HeaderApi(token).getHeaders());
  }

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
  Future<Response> join(String path, String token) {
    return post(path, {}, headers: HeaderApi(token).getHeaders());
  }
  
  Future<Response> leave(String path, String token) {
    return delete(path, headers: HeaderApi(token).getHeaders());
  }

  Future<Response> updateAlumni(
      String path, String token, AlumniRequest data) {
    return put(path, data.toJson(), headers: HeaderApi(token).getHeaders());
  }

  //------------Event------------
  Future<Response> getEvents(String path, String token, EventRequest params) {
    return get(path,
        headers: HeaderApi(token).getHeaders(), query: params.toJson());
  }

  //------------News------------
  Future<Response> getNews(String path, String token, NewsRequest params) {
    return get(path,
        headers: HeaderApi(token).getHeaders(), query: params.toJson());
  }

  //------------Group------------
  Future<Response> getGroupById(String path, String token) {
    return get(path, headers: HeaderApi(token).getHeaders());
  }

  Future<Response> getGroups(String path, String token, GroupRequest? params) {
    return get(path,
        headers: HeaderApi(token).getHeaders(), query: params?.toJson());
  }

  Future<Response> getAlumniInGroup(
      String path, String token, AlumniGroupRequest params) {
    return get(path,
        headers: HeaderApi(token).getHeaders(), query: params.toJson());
  }

  //------------Recruitment------------
  Future<Response> createJob(
      String path, String token, RecruitmentPostRequest data) {
    return post(path, data.toJson(), headers: HeaderApi(token).getHeaders());
  }

  Future<Response> getJobs(
      String path, String token, RecruitmentGetRequest params) {
    return get(path,
        headers: HeaderApi(token).getHeaders(), query: params.toJson());
  }

  Future<Response> changeEndDate(
      String path, String token, ExpandEndDateRequest data) {
    return patch(path, data.toJson(), headers: HeaderApi(token).getHeaders());
  }

  Future<Response> updateJob(
      String path, String token, RecruitmentPostRequest data) {
    return put(path, data.toJson(), headers: HeaderApi(token).getHeaders());
  }

  //-----------Referral----------
  Future<Response> getReferrals(
      String path, String token, ReferralRequest params) {
    return get(path,
        headers: HeaderApi(token).getHeaders(), query: params.toJson());
  }

  Future<Response> createReferral(
      String path, String token, ReferralPostRequest data) {
    return post(path, data.toJson(), headers: HeaderApi(token).getHeaders());
  }

  Future<Response> deleteReferral(String path, token) {
    return delete(path, headers: HeaderApi(token).getHeaders());
  }

  Future<Response> updateReferral(
      String path, String token, ReferralPostRequest data) {
    print('>>API: ' + data.id.toString());
    return put(path, data.toJson(), headers: HeaderApi(token).getHeaders());
  }

  //-----------Voucher------------
  Future<Response> getVouchers(
      String path, String token, VoucherRequest params) {
    print(params.toString());
    return get(path,
        headers: HeaderApi(token).getHeaders(), query: params.toJson());
  }
  //-----------Company------------
 Future<Response> getCompanies(String path, String token, CompanyRequest params){
    return get(path, headers: HeaderApi(token).getHeaders(), query: params.toJson());
 }

}
