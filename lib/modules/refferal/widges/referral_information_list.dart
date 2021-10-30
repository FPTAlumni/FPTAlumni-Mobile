
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/refferal/widges/referral_list_card.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

import '../referral_controller.dart';

class ReferralInformation extends StatelessWidget {
  final referralController = Get.find<ReferralController>();
  var list;
  final ScrollController scrollController;
  var isLoading;
  ReferralInformation({
    required this.list,
    required this.scrollController,
    this.isLoading,
  }) ;


  @override
  Widget build(BuildContext context) {
    list = referralController.referrals;
    return Container(
      width: double.infinity,
        child: RefreshIndicator(
          onRefresh: () => referralController.refreshReferralList(),
          child: Obx(()  {
            if (list.length == 0) {
              return Container(
                alignment: Alignment.center,
                child: Text(
                  'There is no referral',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }
            return  Scrollbar(
              child: ListView.builder(
                  key: key,
                  // controller: scrollController ,
                  itemCount: list.length,
                  itemBuilder: (ctx, i){
                    if(i  ==  list.length){
                      const SizedBox(height: 10);
                      return Center(
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: ColorConstants.primaryAppColor,
                          ),
                        ),
                      );
                    }
                    return ReferralCard(list[i]);
                  }
              ),
            );
          }),
        ),
    );
  }
}
