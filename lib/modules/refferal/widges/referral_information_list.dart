
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/refferal/widges/referral_list_card.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

import '../referral_controller.dart';

class ReferralInformation extends StatelessWidget {
  final referralController = Get.find<ReferralController>();
  var list;
  // final ScrollController scrollController;
  // RefreshCallback  onRefresh;
  var isLoading;
  // ReferralInformation({required this.list, required this.scrollController, required this.onRefresh});


  @override
  Widget build(BuildContext context) {
    list = referralController.referrals;
    return Container(
      width: double.infinity,
        child: Obx(()  {
          // if (list.length == 0 && isLoading.value) {
          //   return Container(
          //     alignment: Alignment.center,
          //     child: Text(
          //       'There is no referral',
          //       style: TextStyle(
          //         fontSize: 18,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //   );
          // }
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

      // child: ListView(
      //   shrinkWrap: true,
      //   children: [
      //     ReferralCard(url, "Nguyen Phan Quynh Anh", "Pending", Colors.green, true),
      //     const SizedBox(height: 10),
      //     ReferralCard(url, "Nguyen Ngoc  Diep", "Permitted", Colors.yellowAccent, false),
      //     const SizedBox(height: 10),
      //     ReferralCard(url, "Nguyen Bao  Thu", "Done", Colors.grey, false),
      //     const SizedBox(height: 10),
      //     ReferralCard(url, "Ho Dinh Tung Lam", "Done", Colors.grey, false),
      //     const SizedBox(height: 10),
      //     ReferralCard(url, "Bo Tan Bao", "Cancel", Colors.red, false),
      //     const SizedBox(height: 10),
      //     ReferralCard(url, "Tran Khai Tan", "Cancel", Colors.red,  false),
      //     const SizedBox(height: 10),
      //   ],
      // ),
    );
  }
}
