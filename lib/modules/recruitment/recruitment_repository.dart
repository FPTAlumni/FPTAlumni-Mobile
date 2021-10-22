import 'package:uni_alumni/api/api_provider.dart';
import 'package:uni_alumni/models/recruitment.dart';
import 'package:uni_alumni/models/request/group_request.dart';
import 'package:uni_alumni/models/request/recruitment_get_request.dart';
import 'package:uni_alumni/models/request/recruitment_post_request.dart';
import 'package:uni_alumni/models/response/recruitment_group_response.dart';

class RecruitmentRepository {
  final ApiProvider apiProvider;

  RecruitmentRepository({required this.apiProvider});

  Future<List<RecruitmentGroupResponse>?> getGroups(
      String token, GroupRequest? params) async {
    final response = await apiProvider.getGroups('/groups', token, params);
    if (response.statusCode == 200) {
      List responseList = response.body['data'];
      return responseList
          .map((json) => RecruitmentGroupResponse.fromJson(json['group']))
          .toList();
    }
  }

  Future<bool> createRecruitment(
      String token, RecruitmentPostRequest data) async {
    final response = await apiProvider.createJob('/recruitments', token, data);
    print(response.body.toString());
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }

  Future<List<Recruitment?>?> getJobs(
      String token, RecruitmentGetRequest params) async {
    final response = await apiProvider.getJobs('/recruitments', token, params);
    print(response.statusCode);
    if (response.statusCode == 200) {
      List responseList = response.body['data'];
      return responseList.map((json) => Recruitment.fromJson(json)).toList();
    }
  }
}
