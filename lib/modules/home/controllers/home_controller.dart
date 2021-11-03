import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/models/event.dart';
import 'package:uni_alumni/models/news.dart';
import 'package:uni_alumni/models/recruitment.dart';
import 'package:uni_alumni/models/request/event_request.dart';
import 'package:uni_alumni/models/request/news_request.dart';
import 'package:uni_alumni/models/request/recruitment_get_request.dart';
import 'package:uni_alumni/modules/auth/auth_controller.dart';
import 'package:uni_alumni/modules/events/event_repository.dart';
import 'package:uni_alumni/modules/news/news_repository.dart';
import 'package:uni_alumni/modules/recruitment/recruitment_repository.dart';
import 'package:uni_alumni/shared/data/enum/common_enum.dart';
import 'package:uni_alumni/shared/data/enum/event_enum.dart';

class HomeController extends GetxController {
  late EventRepository _eventRepository;
  late NewsRepository _newsRepository;
  late RecruitmentRepository _recruitmentRepository;

  final _userAuthentication = Get.find<AuthController>().userAuthentication;

  //control toggle
  var isHome = true.obs;

  int _pageSize = 5;
  int _page = 1;
  var posts = [].obs;
  ScrollController scrollController = ScrollController();
  bool _isFirstLoading = true;

  var isLoading = true.obs;
  bool _newsLoading = true;
  bool _eventLoading = true;
  bool _jobLoading = true;

  @override
  void onInit() {
    super.onInit();
    _eventRepository = Get.find<EventRepository>();
    _newsRepository = Get.find<NewsRepository>();
    _recruitmentRepository = Get.find<RecruitmentRepository>();

    scrollController.addListener(_scrollListener);
  }

  @override
  void onReady() async {
    super.onReady();
    if (_isFirstLoading) {
      await getPosts();
      _isFirstLoading = false;
    }
  }

  void _scrollListener() {
    isLoading.value = true;
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      getPosts().then((_) {
        isLoading.value = false;
      });
    }
  }

  onHomeGroupToggle() {
    isHome.value = !isHome.value;
  }

  getPosts() async {
    print('get posts');
    List<dynamic> _temp = [];
    List<News>? _newsList;
    List<Recruitment>? _jobsList;
    List<Event>? _eventList;

    print(_page);

    //get news
    if (_newsLoading) {
      print('get news');
      NewsRequest newsRequest = NewsRequest(
        page: _page.toString(),
        pageSize: _pageSize.toString(),
      );

      _newsList = await _newsRepository.getNews(
          _userAuthentication!.appToken, newsRequest);

      if (_newsList != null && _newsList.isNotEmpty) {
        _temp.addAll(_newsList);
      } else {
        _newsLoading = false;
      }
    }

    //get jobs
    if (_jobLoading) {
      print('get job');
      RecruitmentGetRequest jobRequest = RecruitmentGetRequest(
        page: _page.toString(),
        pageSize: _pageSize.toString(),
      );

      _jobsList = await _recruitmentRepository.getJobs(
          _userAuthentication!.appToken, jobRequest);
      if (_jobsList != null && _jobsList.isNotEmpty) {
        _temp.addAll(_jobsList);
      } else {
        _jobLoading = false;
      }
    }

    //get events
    if (_eventLoading) {
      print('get event');
      EventRequest eventRequest = EventRequest(
        page: _page.toString(),
        pageSize: _pageSize.toString(),
        sortOrder: SortOrder.DESC,
        sortKey: EventSortKey.registrationEndDate,
      );

      try {
        _eventList = await _eventRepository.getEvents(
            _userAuthentication!.appToken, eventRequest);
        if (_eventList != null) {
          _temp.addAll(_eventList);
        }
      } on Exception {
        _eventLoading = false;
      }
    }

    if (_temp.isNotEmpty) {
      _temp.sort((a, b) {
        DateTime aDate = (a is Event) ? a.registrationEndDate : a.createdDate;
        DateTime bDate = (b is Event) ? b.registrationEndDate : b.createdDate;
        return -aDate.compareTo(bDate);
      });

      posts.addAll(_temp);
    }

    if (_newsLoading || _jobLoading || _eventLoading) {
      _page++;
      isLoading.value = true;
    }

    if (posts.length < _pageSize) {
      isLoading.value = false;
    }
  }

  Future<void> refresh() async {
    isLoading.value = false;
    posts.value = [];
    _page = 1;
    _newsLoading = true;
    _eventLoading = true;
    _jobLoading = true;
    await getPosts();
  }
}
