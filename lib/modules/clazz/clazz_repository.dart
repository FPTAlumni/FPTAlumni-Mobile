import 'package:uni_alumni/api/api_provider.dart';
import 'package:uni_alumni/models/clazz.dart';

class ClazzRepository {
  final ApiProvider apiProvider;

  ClazzRepository({required this.apiProvider});

  Future<List<Clazz>?> getClasses() async {
    final response = await apiProvider.getClasses('/class');
    if (response.statusCode == 200) {
      List responseList = response.body['data'];
      return responseList.map((json) => Clazz.fromJson(json)).toList();
    }
  }
}
