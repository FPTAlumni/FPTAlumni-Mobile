


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/refferal/widges/referral_information_list.dart';

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
      body: ReferralInformation(),
    );
  }
}
