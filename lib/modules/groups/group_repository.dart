import 'package:uni_alumni/api/api_provider.dart';
import 'package:uni_alumni/models/alumni.dart';
import 'package:uni_alumni/models/group.dart';
import 'package:uni_alumni/models/request/alumni_group_request.dart';
import 'package:uni_alumni/models/request/group_request.dart';
import 'package:uni_alumni/models/response/alumni_group_response.dart';

class GroupRepository {
  final ApiProvider apiProvider;

  GroupRepository({required this.apiProvider});

  Future<Group?> getGroupById(String token, int groupId) async {
    final response = await apiProvider.getGroupById('/groups/$groupId', token);
    if (response.isOk) {
      return Group.fromJson(response.body['data']);
    }
  }

  Future<List<Group>?> getGroups(String token, GroupRequest params) async {
    final response = await apiProvider.getGroups('/groups', token, params);
    if (response.isOk) {
      List responseList = response.body['data'];
      return responseList.map((group) => Group.fromJson(group)).toList();
    }
  }

  Future<bool> joinGroup(String token, int groupId) async {
    final response = await apiProvider.join('/alumnus/groups/$groupId', token);
    if (response.isOk) {
      return true;
    }
    return false;
  }

  Future<bool> cancelJoinRequest(String token, int groupId) async {
    final response = await apiProvider.deleteMethod(
        '/alumnus/groups/cancel/$groupId', token);
    if (response.isOk) {
      return true;
    }
    return false;
  }

  Future<bool> leaveGroup(String token, int groupId) async {
    final response =
        await apiProvider.deleteMethod('/alumnus/groups/$groupId', token);
    if (response.isOk) {
      return true;
    }
    return false;
  }

  Future<AlumniGroupResponse?> getAlumniInGroup(
      String token, AlumniGroupRequest params) async {
    final response = await apiProvider.getAlumniInGroup(
        '/groups/${params.groupId}/alumni', token, params);
    if (response.statusCode == 200) {
      List responseList = response.body['data'];
      if (responseList.isNotEmpty) {
        return AlumniGroupResponse.fromJson(response.body['data'][0]);
      }
    }
  }
}
