
import 'package:uni_alumni/api/api_provider.dart';
import 'package:uni_alumni/models/alumni.dart';
import 'package:uni_alumni/models/request/alumni_request.dart';

class AlumniRepository{

  final ApiProvider apiProvider;

  AlumniRepository({required this.apiProvider});

  Future<Alumni?> updateAlumni(String appToken, AlumniRequest data) async {
    final response = await apiProvider.updateAlumni('/alumnus', appToken, data);
    print('>>Alumni: ' + response.statusCode.toString());
    if(response.statusCode == 200){
      return Alumni.fromJson(response.body['data']);
    }
    return null;
  }


}