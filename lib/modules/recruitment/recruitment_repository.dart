import 'package:uni_alumni/api/api_provider.dart';
import 'package:uni_alumni/models/group.dart';
import 'package:uni_alumni/models/recruitment.dart';
import 'package:uni_alumni/models/request/expand_end_date_request.dart';
import 'package:uni_alumni/models/request/group_request.dart';
import 'package:uni_alumni/models/request/recruitment_get_request.dart';
import 'package:uni_alumni/models/request/recruitment_post_request.dart';

class RecruitmentRepository {
  final ApiProvider apiProvider;

  RecruitmentRepository({required this.apiProvider});

  Future<List<Group>?> getGroups(String token, GroupRequest? params) async {
    final response = await apiProvider.getGroups('/groups', token, params);
    if (response.statusCode == 200) {
      List responseList = response.body['data'];
      return responseList.map((json) => Group.fromJson(json)).toList();
    }
  }

  Future<bool> createRecruitment(
      String token, RecruitmentPostRequest data) async {
    final response = await apiProvider.createJob('/recruitments', token, data);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<List<Recruitment?>?> getJobs(
      String token, RecruitmentGetRequest params) async {
    final response = await apiProvider.getJobs('/recruitments', token, params);
    if (response.statusCode == 200) {
      List responseList = response.body['data'];
      return responseList.map((json) => Recruitment.fromJson(json)).toList();
    }
  }

  Future<bool> deleteJob(String token, int id) async {
    final response = await apiProvider.deleteMethod('/recruitments/$id', token);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<Recruitment?> updateJob(
      String token, RecruitmentPostRequest data) async {
    final response = await apiProvider.updateJob('/recruitments', token, data);
    if (response.statusCode == 200) {
      return Recruitment.fromJson(response.body['data']);
    }
    return null;
  }

  Future<Recruitment?> changeEndDate(
      String token, ExpandEndDateRequest data) async {
    final response =
        await apiProvider.changeEndDate('/recruitments/end-date', token, data);
    if (response.statusCode == 200) {
      return Recruitment.fromJson(response.body['data']);
    }
    return null;
  }
}
