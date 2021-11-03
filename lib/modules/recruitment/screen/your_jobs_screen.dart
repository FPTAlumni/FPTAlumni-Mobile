import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/auth/auth_controller.dart';
import 'package:uni_alumni/modules/recruitment/controllers/your_jobs_controller.dart';
import 'package:uni_alumni/modules/recruitment/widgets/recruitment_list.dart';
import 'package:uni_alumni/routes/app_pages.dart';
import 'package:uni_alumni/shared/constants/colors.dart';
import 'package:uni_alumni/shared/widgets/error_dialog.dart';
import 'package:uni_alumni/shared/widgets/sub_screen_app_bar.dart';

class YourJobsScreen extends GetView<YourJobsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SubScreenAppBar(
        title: 'Your jobs',
        actions: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorConstants.lightPrimaryAppColor,
            ),
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.only(
              right: 10,
            ),
            child: GestureDetector(
              onTap: () async {
                controller.showJobFilter();
              },
              child: Container(
                width: 25,
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Image.asset(
                    'assets/images/filter.png',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorConstants.lightPrimaryAppColor,
            ),
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.only(
              right: 10,
            ),
            child: GestureDetector(
              onTap: () async {
                final _currentUser = Get.find<AuthController>().currentUser;
                if (_currentUser?.company == null) {
                  ErrorDialog.showDialog(
                      content: 'Please update your company in your '
                          'profile before creating the job');
                  return;
                }

                var result = await Get.toNamed(Routes.recruitmentForm);
                if (result != null && result) {
                  controller.refresh();
                }
              },
              child: Container(
                width: 25,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
          ),
        ],
      ),
      body: RecruitmentList(
        list: controller.myJobs,
        scrollController: controller.scrollController,
        onRefresh: controller.refresh,
        isLoading: controller.isLoading,
        isMyJobs: true,
      ),
    );
  }
}
