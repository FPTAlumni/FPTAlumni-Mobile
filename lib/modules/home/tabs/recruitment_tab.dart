import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/recruitment/recruitment_controller.dart';
import 'package:uni_alumni/modules/recruitment/widgets/recruitment_list.dart';
import 'package:uni_alumni/shared/constants/assets.dart';
import 'package:uni_alumni/shared/constants/colors.dart';
import 'package:uni_alumni/shared/data/filters.dart';
import 'package:uni_alumni/shared/utils/filter_dialog.dart';

class RecruitmentTab extends StatelessWidget {
  final RecruitmentController controller = Get.put(RecruitmentController());
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
      body: RecruitmentList(),
    );
  }
}
