


import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/refferal/widges/referral_information_list.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

import '../referral_controller.dart';

class ReferralList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
         title: Text('Referral', style: TextStyle(color: Colors.black)),
         elevation: 0.0,
         backgroundColor: Colors.white,
         iconTheme: IconThemeData(
              color: Colors.black,
         )
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
                        onTap: () {/* Do someting */},
                      ),
                      SpeedDialChild(
                        child: Icon(Icons.add),
                        label: 'Add new referral',
                        backgroundColor: ColorConstants.lightPrimaryAppColor,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ])
      ),
    );
  }
}
