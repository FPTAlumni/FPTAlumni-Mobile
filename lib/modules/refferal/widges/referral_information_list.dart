
import 'package:flutter/material.dart';
import 'package:uni_alumni/modules/refferal/widges/referral_list_card.dart';
import 'package:uni_alumni/shared/card/alumni_card.dart';

class ReferralInformation extends StatelessWidget {
  const ReferralInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final String url =  'https://is5-ssl.mzstatic.com/image/thumb/Purple124/v4/49/85/49/498549f0-b50a-1fa5-44d3-248b1fb35f6e/source/512x512bb.jpg';

    return Container(
      width: double.infinity,
      child: ListView(
        shrinkWrap: true,
        children: [
          ReferralCard(url, "Nguyen Phan Quynh Anh", "Pending", Colors.green, true),
          const SizedBox(height: 10),
          ReferralCard(url, "Nguyen Ngoc  Diep", "Permitted", Colors.yellowAccent, false),
          const SizedBox(height: 10),
          ReferralCard(url, "Nguyen Bao  Thu", "Done", Colors.grey, false),
          const SizedBox(height: 10),
          ReferralCard(url, "Ho Dinh Tung Lam", "Done", Colors.grey, false),
          const SizedBox(height: 10),
          ReferralCard(url, "Bo Tan Bao", "Cancel", Colors.red, false),
          const SizedBox(height: 10),
          ReferralCard(url, "Tran Khai Tan", "Cancel", Colors.red,  false),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
