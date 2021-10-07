import 'package:uni_alumni/api/api_provider.dart';
import 'package:uni_alumni/models/university.dart';

class UniversityRepository {
  final ApiProvider apiProvider;
  UniversityRepository({required this.apiProvider});

  Future<List<University>?> getUniversities() async {
    final response = await apiProvider.getUniversities('/university');
    if (response.statusCode == 200) {
      List responseList = response.body['data'];
      return responseList.map((json) => University.fromJson(json)).toList();
    }
  }
}
