

import 'package:uni_alumni/api/api_provider.dart';
import 'package:uni_alumni/models/news.dart';

class NewsRepositories{
  final ApiProvider apiProvider;
  NewsRepositories({required this.apiProvider});
  
  Future<List<News>?> getNews() async{
    final response = await apiProvider.getNews('/news');
    if(response.statusCode == 200){
      List responseList = response.body['data'];
      return responseList.map((json) => News.fromJson(json)).toList();
    }
  }
}