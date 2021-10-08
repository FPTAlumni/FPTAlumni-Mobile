
import 'package:get/get.dart';
import 'package:uni_alumni/models/news.dart';
import 'package:uni_alumni/modules/news/news_repositorry.dart';

class NewsController extends GetxController{
  final NewsRepositories newsRepositories;

  NewsController({required this.newsRepositories});

  var news = [].obs;

  @override
  void onInit() {
    super.onInit();
  }
  Future<void> loadNews() async {
    List<News>? _news =
    await newsRepositories.getNews();
    if (_news != null) {
    news.value = _news;
    }
  }

}