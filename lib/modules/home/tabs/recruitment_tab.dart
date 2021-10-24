import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/recruitment/controllers/recruitment_tab_controller.dart';
import 'package:uni_alumni/modules/recruitment/widgets/recruitment_list.dart';
import 'package:uni_alumni/routes/app_pages.dart';
import 'package:uni_alumni/shared/constants/assets.dart';
import 'package:uni_alumni/shared/constants/colors.dart';
import 'package:uni_alumni/shared/data/filters.dart';
import 'package:uni_alumni/shared/utils/filter_dialog.dart';

class RecruitmentTab extends StatelessWidget {
  final RecruitmentTabController controller =
      Get.find<RecruitmentTabController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(right: 15.0),
              child: Image.asset(
                AssetConstants.logo,
                width: 40,
              ),
            ),
            Text(
              'ALUMNI',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: ColorConstants.primaryAppColor,
                fontSize: 20,
                fontFamily: 'Poppins',
                letterSpacing: 3,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        child: Stack(
          children: [
            RecruitmentList(
              list: controller.jobs,
              scrollController: controller.scrollController,
              onRefresh: controller.refresh,
              isLoading: controller.isLoading,
            ),
            Positioned(
              bottom: 16,
              right: 16,
              child: SpeedDial(
                icon: Icons.category,
                backgroundColor: ColorConstants.lightPrimaryAppColor,
                spacing: 15,
                children: [
                  SpeedDialChild(
                    child: Icon(
                      Icons.work,
                      color: Colors.white,
                    ),
                    label: 'Your jobs',
                    backgroundColor: ColorConstants.lightPrimaryAppColor,
                    onTap: () {
                      Get.toNamed(Routes.yourRecruitment);
                    },
                  ),
                  SpeedDialChild(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    label: 'Create your job',
                    backgroundColor: ColorConstants.lightPrimaryAppColor,
                    onTap: () {
                      Get.toNamed(Routes.recruitmentForm);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
