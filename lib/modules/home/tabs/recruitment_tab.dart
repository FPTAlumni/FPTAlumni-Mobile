import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/recruitment/recruitment_controller.dart';
import 'package:uni_alumni/modules/recruitment/screen/recruitment_crud.dart';
import 'package:uni_alumni/modules/recruitment/widgets/recruitment_list.dart';
import 'package:uni_alumni/shared/constants/assets.dart';
import 'package:uni_alumni/shared/constants/colors.dart';
import 'package:uni_alumni/shared/data/filters.dart';
import 'package:uni_alumni/shared/utils/filter_dialog.dart';

class RecruitmentTab extends StatelessWidget {
  final RecruitmentController controller = Get.find<RecruitmentController>();
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
            RecruitmentList(),
            Positioned(
              bottom: 16,
              right: 16,
              child: SpeedDial(
                icon: Icons.category,
                backgroundColor: ColorConstants.lightPrimaryAppColor,
                spacing: 15,
                children: [
                  SpeedDialChild(
                    child: Icon(Icons.work),
                    label: 'Your jobs',
                    backgroundColor: ColorConstants.lightPrimaryAppColor,
                    onTap: () {/* Do someting */},
                  ),
                  SpeedDialChild(
                    child: Icon(Icons.add),
                    label: 'Create your job',
                    backgroundColor: ColorConstants.lightPrimaryAppColor,
                    onTap: () {
                      Get.to(() => RecruitmentCRUD());
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
