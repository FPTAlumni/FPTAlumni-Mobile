import 'package:uni_alumni/api/api_provider.dart';
import 'package:uni_alumni/models/group.dart';
import 'package:uni_alumni/models/request/group_request.dart';

class GroupRepository {
  final ApiProvider apiProvider;

  GroupRepository({required this.apiProvider});

  Future<Group?> getGroupById(String token, int groupId) async {
    final response = await apiProvider.getGroupById('/groups/$groupId', token);
    if (response.isOk) {
      return Group.fromJson(response.body['data']);
    }
  }

  Future<List<Group>?> getMyGroup(String token, GroupRequest params) async {
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
    final response =
        await apiProvider.leave('/alumnus/groups/cancel/$groupId', token);
    if (response.isOk) {
      return true;
    }
    return false;
  }
}
