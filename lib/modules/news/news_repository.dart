import 'package:uni_alumni/api/api_provider.dart';
import 'package:uni_alumni/models/news.dart';
import 'package:uni_alumni/models/request/news_request.dart';

class NewsRepository {
  ApiProvider apiProvider;

  NewsRepository({required this.apiProvider});

  Future<List<News>?> getNews(String token, NewsRequest params) async {
    final response = await apiProvider.getNews("/news", token, params);
    print(response.statusCode);
    if (response.statusCode == 200) {
      List responseList = response.body['data'];
      return responseList.map((news) => News.fromJson(news)).toList();
    }

    if (response.statusCode == 204) {
      throw Exception('There is no news');
    }
  }
}
