import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/models/recruitment.dart';
import 'package:uni_alumni/models/request/recruitment_get_request.dart';
import 'package:uni_alumni/modules/auth/auth_controller.dart';

import '../recruitment_repository.dart';

class YourJobsController extends GetxController {
  final RecruitmentRepository recruitmentRepository;

  YourJobsController({required this.recruitmentRepository});

  final userAuthentication = Get.find<AuthController>().userAuthentication;

  var myJobs = [].obs;
  final ScrollController scrollController = ScrollController();

  final _pageSize = 5;
  int _page = 1;
  String? error;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getMyJobs();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getMyJobs().then((_) {
          if (error != null) {
            scrollController
                .jumpTo(scrollController.position.maxScrollExtent - 45);
          }
        });
      }
    });
  }

  getMyJobs() async {
    print('get my jobs');
    RecruitmentGetRequest params = RecruitmentGetRequest(
      page: _page.toString(),
      pageSize: _pageSize.toString(),
      alumniId: userAuthentication!.id.toString(),
    );

    List<Recruitment?>? _jobs = await recruitmentRepository.getJobs(
        userAuthentication!.appToken, params);
    if (_jobs != null && _jobs.isNotEmpty) {
      myJobs.addAll(_jobs);
      _page++;
      error = null;
      isLoading.value = true;
      if (myJobs.length < _pageSize) {
        isLoading.value = false;
      }
    } else {
      error = 'There is no jobs';
    }
  }

  Future<void> refresh() async {
    isLoading.value = false;
    myJobs.value = [];
    _page = 1;
    error = null;
    await getMyJobs();
  }
}
