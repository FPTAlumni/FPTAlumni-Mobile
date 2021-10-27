import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/models/news.dart';
import 'package:uni_alumni/models/request/news_request.dart';
import 'package:uni_alumni/modules/auth/auth_controller.dart';
import 'package:uni_alumni/modules/news/news_repository.dart';

class NewsController extends GetxController {
  final NewsRepository newsRepository;

  NewsController({required this.newsRepository});

  final userAuthentication = Get.find<AuthController>().userAuthentication;
  final ScrollController scrollController = ScrollController();

  var news = [].obs;

  final _pageSize = 4;
  int _page = 1;
  String? error;
  var isLoading = true.obs;

  @override
  onInit() {
    super.onInit();
    getNewsOfCurrentAlumni();
    scrollController.addListener(() {
      isLoading.value = true;
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getNewsOfCurrentAlumni().then((_) {
          if (error != null) {
            isLoading.value = false;
          }
        });
      }
    });
  }

  getNewsOfCurrentAlumni() async {
    print('load news');
    NewsRequest params = NewsRequest(
      pageSize: _pageSize.toString(),
      page: _page.toString(),
    );

    List<News>? _news =
        await newsRepository.getNews(userAuthentication!.appToken, params);

    if (_news != null && _news.isNotEmpty) {
      error = null;
      news.addAll(_news);
      _page++;
      isLoading.value = true;
    } else {
      error = 'There is no news';
    }
  }

  Future<void> refresh() async {
    isLoading.value = false;
    news.value = [];
    _page = 1;
    error = null;
    await getNewsOfCurrentAlumni();
  }
}
