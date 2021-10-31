import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/models/referral.dart';
import 'package:uni_alumni/modules/recruitment/controllers/your_jobs_controller.dart';
import 'package:uni_alumni/modules/refferal/screens/referral_detail.dart';
import 'package:uni_alumni/routes/app_pages.dart';
import 'package:uni_alumni/shared/constants/colors.dart';
import 'package:uni_alumni/shared/data/enum/recruitment_enum.dart';

import '../referral_controller.dart';

class ReferralActions {
  static showBottomSheet(Referral referral, {bool isInDetails = false}) {
    final referralController = Get.find<ReferralController>();

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
            if ( referral.status == 3) ...[ //pending | verified
              _buildListTile(
                icon: Icons.edit,
                title: 'Edit referral\'s information',
                onTapHandler: () {
                  closeBottomSheet();
                  print("Referral: " + referral.fullName);
                  referralController.currentReferral = referral;
                  Get.toNamed(Routes.referralForm, arguments: referral);
                },
              ),
              const Divider(
                height: 5.0,
                color: Colors.black45,
              ),
            ],
            // if (job.statusString == MyRecruitmentStatus.approved) ...[
            //   _buildListTile(
            //     icon: Icons.work_off,
            //     title: 'Close job',
            //     onTapHandler: () {
            //       closeBottomSheet();
            //       controller.closeJob(job.id!);
            //     },
            //   ),
            //   const Divider(
            //     height: 5.0,
            //     color: Colors.black45,
            //   ),
            // ],
           if(referral.status == 3)...[ //pending
             _buildListTile(
               icon: Icons.delete,
               title: 'Remove referral',
               onTapHandler: () async {
                 closeBottomSheet();
                 await referralController.deleteReferral(referral.id);
                 if (isInDetails) {
                   Get.back();
                 }
               },
             ),
           ],
            _buildListTile(
              icon: FontAwesomeIcons.info,
              title: 'More detail',
              onTapHandler: () async {
                closeBottomSheet();
                Get.to (() => ReferralDetail(referral));
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
