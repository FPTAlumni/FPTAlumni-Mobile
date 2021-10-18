import 'package:uni_alumni/api/api_provider.dart';
import 'package:uni_alumni/models/group.dart';

class GroupRepository {
  final ApiProvider apiProvider;

  GroupRepository({required this.apiProvider});

  Future<Group?> getGroupById(String token, int id) async {
    final response = await apiProvider.getGroupById('/groups/$id', token);
    if (response.isOk) {
      return Group.fromJson(response.body['data']);
    }
  }
}
