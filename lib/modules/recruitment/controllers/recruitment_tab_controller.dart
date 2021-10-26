import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/models/recruitment.dart';
import 'package:uni_alumni/models/request/recruitment_get_request.dart';
import 'package:uni_alumni/modules/auth/auth_controller.dart';
import 'package:uni_alumni/modules/recruitment/recruitment_repository.dart';
import 'package:uni_alumni/shared/data/enum/common_enum.dart';
import 'package:uni_alumni/shared/data/enum/recruitment_enum.dart';

class RecruitmentTabController extends GetxController {
  var selectedFilterList = [].obs;

  final RecruitmentRepository recruitmentRepository;

  RecruitmentTabController({required this.recruitmentRepository});

  final userAuthentication = Get.find<AuthController>().userAuthentication;

  var jobs = [].obs;
  final ScrollController scrollController = ScrollController();

  final _pageSize = 5;
  int _page = 1;
  String? error;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getJobs();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getJobs().then((_) {
          if (error != null) {
            scrollController
                .jumpTo(scrollController.position.maxScrollExtent - 45);
          }
        });
      }
    });
  }

  getJobs() async {
    print('get jobs');
    RecruitmentGetRequest params = RecruitmentGetRequest(
      page: _page.toString(),
      pageSize: _pageSize.toString(),
      sortKey: RecruitmentSortKey.createdDate,
      sortOrder: SortOrder.DESC,
    );

    List<Recruitment?>? _jobs = await recruitmentRepository.getJobs(
        userAuthentication!.appToken, params);
    if (_jobs != null && _jobs.isNotEmpty) {
      jobs.addAll(_jobs);
      _page++;
      isLoading.value = true;
      error = null;
      if (jobs.length < _pageSize) {
        isLoading.value = false;
      }
    } else {
      error = 'There is no news';
    }
  }

  Future<void> refresh() async {
    isLoading.value = false;
    jobs.value = [];
    _page = 1;
    error = null;
    await getJobs();
  }
}