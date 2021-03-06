import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/models/news.dart';
import 'package:uni_alumni/models/request/news_request.dart';
import 'package:uni_alumni/models/tag.dart';
import 'package:uni_alumni/modules/auth/auth_controller.dart';
import 'package:uni_alumni/modules/news/news_repository.dart';
import 'package:uni_alumni/shared/utils/filter_dialog.dart';

class NewsController extends GetxController {
  final NewsRepository newsRepository;

  NewsController({required this.newsRepository});

  final userAuthentication = Get.find<AuthController>().userAuthentication;
  final ScrollController scrollController = ScrollController();
  final _filterDialog = FilterDialog();

  var news = [].obs;

  final _pageSize = 4;
  int _page = 1;
  String? error;
  var isLoading = true.obs;

  List<Tag> _tags = [];

  Tag? _selectedTag;

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

  @override
  void onReady() async {
    await _loadTagsList();
  }

  NewsRequest _generateParam() {
    return NewsRequest(
      page: _page.toString(),
      pageSize: _pageSize.toString(),
      tagId: _selectedTag?.id.toString() ?? null,
    );
  }

  getNewsOfCurrentAlumni() async {
    print('load news');
    NewsRequest params = _generateParam();

    List<News>? _news =
        await newsRepository.getNews(userAuthentication!.appToken, params);

    if (_news != null && _news.isNotEmpty) {
      error = null;
      news.addAll(_news);
      _page++;
      isLoading.value = true;
      if (news.length < _pageSize) {
        isLoading.value = false;
      }
    } else {
      error = 'There is no news';
    }
  }

  _loadTagsList() async {
    List<Tag>? _tagsList =
        await newsRepository.getTags(userAuthentication!.appToken);
    if (_tagsList != null) {
      _tags = _tagsList;
    }
  }

  showFilter() async {
    bool needRefresh = false;
    await _filterDialog.showDialog(
        context: Get.context!,
        filtersData: _tags,
        selectedFilters: _selectedTag == null ? [] : [_selectedTag!]);
    Tag? _filter = _filterDialog.filter;
    if (_filter == null) {
      if (_selectedTag != null) {
        needRefresh = true;
      }
    } else {
      if (_selectedTag == null || _filter.id != _selectedTag?.id) {
        needRefresh = true;
      }
    }
    _selectedTag = _filter;

    if (needRefresh) {
      refresh();
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
