import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/recruitment/controllers/your_jobs_controller.dart';
import 'package:uni_alumni/modules/recruitment/widgets/recruitment_list.dart';
import 'package:uni_alumni/shared/widgets/sub_screen_app_bar.dart';

class YourJobsScreen extends GetView<YourJobsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SubScreenAppBar(title: 'Your jobs'),
      body: RecruitmentList(
        list: controller.myJobs,
        scrollController: controller.scrollController,
        onRefresh: controller.refresh,
        isLoading: controller.isLoading,
      ),
    );
  }
}
