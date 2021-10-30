

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../referral_controller.dart';
import 'referral_information_list.dart';

class ReloadingReferral extends StatelessWidget {
  final referralController = Get.find<ReferralController>();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      referralController.isLoading.value = true;
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        referralController.getReferralByAlumni().then((_) {
          if (referralController.error != null) {
            referralController.isLoading.value = false;
          }
        });
      }
    });

    return ReferralInformation(
      list: referralController.referrals,
      scrollController: _scrollController,
      isLoading: referralController.isLoading,
    );
  }
}
