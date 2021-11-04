

import 'package:uni_alumni/api/api_provider.dart';
import 'package:uni_alumni/models/company.dart';
import 'package:uni_alumni/models/request/company_request.dart';

class CompanyRepository{
  ApiProvider apiProvider;

  CompanyRepository({required this.apiProvider});

   Future<List<Company>?> getCompanies (String token, CompanyRequest params) async {
     final response = await apiProvider.getCompanies('/company',token, params);
     if(response.statusCode==200){
       List responseList = response.body['data'];
       return responseList.map((company) => Company.fromJson(company)).toList();
     }
     if(response.statusCode == 204){
       print('No company was found');
       return [];
     }
   }
}