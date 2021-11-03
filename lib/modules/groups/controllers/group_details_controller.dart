import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/models/event.dart';
import 'package:uni_alumni/models/group.dart';
import 'package:uni_alumni/models/news.dart';
import 'package:uni_alumni/models/recruitment.dart';
import 'package:uni_alumni/models/request/event_request.dart';
import 'package:uni_alumni/models/request/group_request.dart';
import 'package:uni_alumni/models/request/news_request.dart';
import 'package:uni_alumni/models/request/recruitment_get_request.dart';
import 'package:uni_alumni/modules/auth/auth_controller.dart';
import 'package:uni_alumni/modules/events/event_repository.dart';
import 'package:uni_alumni/modules/groups/controllers/your_groups_controller.dart';
import 'package:uni_alumni/modules/groups/group_repository.dart';
import 'package:uni_alumni/modules/news/news_repository.dart';
import 'package:uni_alumni/modules/recruitment/recruitment_repository.dart';
import 'package:uni_alumni/shared/data/enum/common_enum.dart';
import 'package:uni_alumni/shared/data/enum/event_enum.dart';
import 'package:uni_alumni/shared/widgets/confirm_dialog.dart';
import 'package:uni_alumni/shared/widgets/error_dialog.dart';

class GroupDetailsController extends GetxController {
  final GroupRepository groupRepository;
  late EventRepository _eventRepository;
  late NewsRepository _newsRepository;
  late RecruitmentRepository _recruitmentRepository;

  GroupDetailsController({required this.groupRepository});

  final _userAuthentication = Get.find<AuthController>().userAuthentication;

  static const maxChildGroup = 3;

  Group? currentGroup;

  var groupChild = [].obs;
  var isGroupChildLoading = true.obs;
  int _groupPageSize = maxChildGroup + 1;
  int _postsPageSize = 5;
  int _page = 1;
  var posts = [].obs;
  Future? getGroupChild;

  final groupChildHeight = 100.0;
  ScrollController scrollController = ScrollController();

  var isVisibility = true.obs;
  var isLoading = true.obs;
  bool _newsLoading = true;
  bool _eventLoading = true;
  bool _jobLoading = true;
  bool _firstLoading = true;

  @override
  void onInit() {
    super.onInit();
    _eventRepository = Get.find<EventRepository>();
    _newsRepository = Get.find<NewsRepository>();
    _recruitmentRepository = Get.find<RecruitmentRepository>();

    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    ScrollDirection direction = scrollController.position.userScrollDirection;

    if (direction == ScrollDirection.forward) {
      Future.delayed(Duration(milliseconds: 100))
          .then((_) => isVisibility.value = true);
    } else {
      Future.delayed(Duration(milliseconds: 100))
          .then((_) => isVisibility.value = false);
    }

    isLoading.value = true;
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      getPosts().then((_) {
        isLoading.value = false;
      });
    }
  }

  @override
  void onReady() {
    super.onReady();
    getGroupChild = _getGroupChild();
    if (_firstLoading) {
      getPosts();
      _firstLoading = false;
    }
  }

  _getGroupChild() async {
    //only load group child if this is the root parent
    // if (currentGroup!.parentGroup != null) return;
    isGroupChildLoading.value = true;
    print('get group child');
    GroupRequest params = GroupRequest(
      parentGroupId: currentGroup!.id.toString(),
      pageSize: _groupPageSize.toString(),
      // page: _page.toString(),
    );

    List<Group>? _groups =
        await groupRepository.getGroups(_userAuthentication!.appToken, params);
    if (_groups != null) {
      groupChild.value = _groups;
      isGroupChildLoading.value = false;
    }
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
        groupId: currentGroup!.id.toString(),
        page: _page.toString(),
        pageSize: _postsPageSize.toString(),
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
        groupId: currentGroup!.id.toString(),
        page: _page.toString(),
        pageSize: _postsPageSize.toString(),
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
        groupId: currentGroup!.id.toString(),
        page: _page.toString(),
        pageSize: _postsPageSize.toString(),
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

    if (posts.length < _postsPageSize) {
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

  toggleRequestJoinGroup(int groupId, {bool join = true}) async {
    bool result = false;

    if (join) {
      result = await groupRepository.joinGroup(
          _userAuthentication!.appToken, groupId);
    } else {
      result = await groupRepository.cancelJoinRequest(
          _userAuthentication!.appToken, groupId);
    }

    if (result) {
      int index = groupChild.indexWhere((group) => group.id == groupId);
      if (join) {
        (groupChild[index] as Group).joinGroup();
      } else {
        (groupChild[index] as Group).cancelJoinGroup();
      }
      groupChild.refresh();
    } else {
      ErrorDialog.showDialog();
    }
  }

  Future<bool> leaveGroup() async {
    if (currentGroup?.leader?.id == _userAuthentication?.id) {
      ErrorDialog.showDialog(
          content: 'Cannot leave since you are the leader of this group');
      return false;
    }

    bool? isConfirmed =
        await ConfirmDialog.showDialog(msg: 'Do you want to leave group?');

    if (isConfirmed == null) {
      return false;
    }

    bool result = await groupRepository.leaveGroup(
        _userAuthentication!.appToken, currentGroup!.id!);
    if (result) {
      //delete this group from my group list
      var yourGroups = Get.find<YourGroupsController>().myGroups;
      int index = yourGroups
          .indexWhere((group) => (group as Group).id == currentGroup!.id);
      if (index > 0) {
        yourGroups.removeAt(index);
        yourGroups.refresh();
      }
      return true;
    } else {
      ErrorDialog.showDialog();
      return false;
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
