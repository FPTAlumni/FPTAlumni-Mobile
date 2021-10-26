import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/models/recruitment.dart';
import 'package:uni_alumni/modules/recruitment/controllers/your_jobs_controller.dart';
import 'package:uni_alumni/routes/app_pages.dart';
import 'package:uni_alumni/shared/constants/colors.dart';
import 'package:uni_alumni/shared/data/enum/recruitment_enum.dart';

class BSJobActions {
  static showBottomSheet(Recruitment job, {bool isInDetails = false}) {
    final controller = Get.find<YourJobsController>();

    Get.bottomSheet(
      Container(
        constraints: BoxConstraints(maxHeight: Get.context!.size!.height * 0.5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (job.statusString == MyRecruitmentStatus.ended) ...[
              _buildListTile(
                icon: Icons.timer,
                title: 'Expand job end date',
                onTapHandler: () {
                  closeBottomSheet();
                  controller.expandEndDate(job.id!);
                },
              ),
              const Divider(
                height: 5.0,
                color: Colors.black45,
              ),
            ],
            if (job.statusString == MyRecruitmentStatus.pending) ...[
              _buildListTile(
                icon: Icons.edit,
                title: 'Edit job',
                onTapHandler: () {
                  closeBottomSheet();
                  Get.toNamed(Routes.recruitmentForm, arguments: job);
                },
              ),
              const Divider(
                height: 5.0,
                color: Colors.black45,
              ),
            ],
            if (job.statusString == MyRecruitmentStatus.approved) ...[
              _buildListTile(
                icon: Icons.work_off,
                title: 'Close job',
                onTapHandler: () {
                  closeBottomSheet();
                  controller.closeJob(job.id!);
                },
              ),
              const Divider(
                height: 5.0,
                color: Colors.black45,
              ),
            ],
            _buildListTile(
              icon: Icons.delete,
              title: 'Remove job',
              onTapHandler: () async {
                closeBottomSheet();
                await controller.deleteJob(job.id!);
                if (isInDetails) {
                  Get.back();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  static closeBottomSheet() {
    Get.back();
  }

  static Widget _buildListTile({
    required IconData icon,
    required String title,
    VoidCallback? onTapHandler,
  }) {
    return InkWell(
      onTap: onTapHandler,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 18.0,
          horizontal: 15.0,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: ColorConstants.primaryAppColor,
              size: 22,
            ),
            const SizedBox(width: 15.0),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
