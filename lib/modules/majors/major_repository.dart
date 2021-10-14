import 'package:uni_alumni/api/api_provider.dart';
import 'package:uni_alumni/models/major.dart';

class MajorRepository {
  final ApiProvider apiProvider;

  MajorRepository({required this.apiProvider});

  Future<List<Major>?> getMajors(int classId) async {
    final response = await apiProvider.getMajorsById('/majors', classId);
    if (response.statusCode == 200) {
      List responseList = response.body['data'];
      return responseList.map((json) => Major.fromJson(json)).toList();
    }
  }
}
