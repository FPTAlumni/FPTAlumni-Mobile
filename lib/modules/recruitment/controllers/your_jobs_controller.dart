import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/models/recruitment.dart';
import 'package:uni_alumni/models/request/expand_end_date_request.dart';
import 'package:uni_alumni/models/request/recruitment_get_request.dart';
import 'package:uni_alumni/modules/auth/auth_controller.dart';
import 'package:uni_alumni/shared/data/enum/common_enum.dart';
import 'package:uni_alumni/shared/data/enum/recruitment_enum.dart';
import 'package:uni_alumni/shared/widgets/date_time_picker_dialog.dart';
import 'package:uni_alumni/shared/widgets/error_dialog.dart';

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
      isLoading.value = true;
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getMyJobs().then((_) {
          if (error != null) {
            isLoading.value = false;
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
      sortKey: RecruitmentSortKey.status,
      sortOrder: SortOrder.ASC,
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

  deleteJob(int id) async {
    bool? result =
        await _showConfirmDialog(msg: 'Do you want to delete this job?');
    if (result == null) return;

    bool isSucceed =
        await recruitmentRepository.deleteJob(userAuthentication!.appToken, id);
    if (isSucceed) {
      myJobs.removeWhere((job) => job.id == id);
      if (myJobs.length < _pageSize) {
        isLoading.value = false;
      }
      myJobs.refresh();
    } else {
      ErrorDialog.showDialog();
    }
  }

  expandEndDate(int id) async {
    DateTime? _selectedDate = await DateTimePickerDialog.showDatePickerDialog();
    if (_selectedDate == null) return;

    changeEndDate(id, _selectedDate);
  }

  closeJob(int id) {
    _showConfirmDialog(msg: 'Do you want to end this job?');
    changeEndDate(id, DateTime.now().toUtc());
  }

  changeEndDate(int id, DateTime time) async {
    ExpandEndDateRequest data =
        ExpandEndDateRequest(jobId: id, endDate: time.toUtc());
    Recruitment? updatedJob = await recruitmentRepository.changeEndDate(
        userAuthentication!.appToken, data);
    if (updatedJob != null) {
      int index = myJobs.indexWhere((job) => job.id == id);
      myJobs[index] = updatedJob;
      myJobs.refresh();
    } else {
      ErrorDialog.showDialog();
    }
  }

  Future<bool?> _showConfirmDialog(
      {String title = 'Confirmation', required String msg}) {
    return Get.defaultDialog(
      title: title,
      content: Text(msg),
      confirm: TextButton(
          onPressed: () {
            Get.back(result: true);
          },
          child: Text('Confirm')),
      cancel: TextButton(
        onPressed: () {
          Get.back();
        },
        child: Text('Cancel'),
      ),
    );
  }
}
