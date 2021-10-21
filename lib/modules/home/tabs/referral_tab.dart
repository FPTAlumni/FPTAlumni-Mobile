import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:get/get.dart';
import 'package:uni_alumni/modules/home/main_controller.dart';
import 'package:uni_alumni/modules/refferal/screens/referral_moreinformation.dart';
import 'package:uni_alumni/modules/refferal/screens/referral_list.dart';
import 'package:uni_alumni/modules/refferal/screens/referral_registration.dart';
import 'package:uni_alumni/modules/refferal/widges/referral_information_list.dart';
import 'package:uni_alumni/shared/constants/assets.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class ReferralTab extends GetView<MainController> {
  final _referralController = new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              'REFERRAL',
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
      body: Container
        (
          height: double.infinity,
          child: Stack(
              children: [
                ReferralInformation(),
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: SpeedDial(
                    icon: Icons.category,
                    backgroundColor: ColorConstants.lightPrimaryAppColor,
                    spacing: 15,
                    children: [
                      SpeedDialChild(
                        child: Icon(Icons.info_outline),
                        label: 'More Information',
                        backgroundColor: ColorConstants.lightPrimaryAppColor,
                        onTap: () {
                          Get.to(() => MoreInformation());
                          },
                      ),
                      SpeedDialChild(
                        child: Icon(Icons.add),
                        label: 'Add new referral',
                        backgroundColor: ColorConstants.lightPrimaryAppColor,
                        onTap: () {
                          Get.to(() => ReferralRegistration());
                        },
                      ),
                    ],
                  ),
                ),
              ])
      ),
    );
  }
}

// Scaffold(

// ),
