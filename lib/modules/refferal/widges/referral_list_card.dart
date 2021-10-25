

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/models/referral.dart';
import 'package:uni_alumni/modules/refferal/screens/referral_detail.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

import '../referral_controller.dart';



class ReferralCard extends StatelessWidget {

  final String url =  'https://is5-ssl.mzstatic.com/image/thumb/Purple124/v4/49/85/49/498549f0-b50a-1fa5-44d3-248b1fb35f6e/source/512x512bb.jpg';
  final controller = Get.find<ReferralController>();
  // final String url;
  // final String fullName;
  // final String status;
  // final Color color;
  bool state = false;

  final Referral referral;

  ReferralCard(this.referral);

  // ReferralCard(this.url, this.fullName, this.status, this.color, this.state);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.deepOrange,
      onTap: (){
        Get.to (() => ReferrallDetail());
      },
      child: Container(
        color: ColorConstants.white,
        width: 50,
        margin: const EdgeInsets.symmetric(
          vertical: 5.0,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: 25.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                right: 10,
              ),
              // padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                border: Border.all(color: ColorConstants.tipColor),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              width: 85,
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: Image.network(
                    url,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    referral.fullName,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      ImageIcon(
                        AssetImage("assets/images/voucher.png"),
                          color: Colors.grey.shade800,
                        size: 19
                      ),
                      const SizedBox(width: 5),
                      Text(
                      (referral.voucher.discountValue * 100).toString() + " %",
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.grey,
                      ),
                    ),
                  ]),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.grey.shade800,
                        size: 19.0
                      ),
                      const SizedBox(width: 5),
                      Text(
                      referral.phone,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.grey,
                      ),
                    ),
                  ]),
                  Container(
                    width: 250,
                    child: Wrap(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          child: Chip(
                            backgroundColor:controller.changeColorStatus( referral.status),
                            label: Text(
                              controller.statusName(referral.status),
                              // 'status',
                              textScaleFactor: 3 / 4,
                            ),
                          ),
                        ),
                        state ? CustomCancel() : Text('')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget CustomCancel() {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.only(left: 150, right: 5),
      height: 40.0,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Color.fromRGBO(200, 0, 0, 1))),
        onPressed: () {},
        padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
        color: Colors.white,
        textColor: Color.fromRGBO(0, 160, 227, 1),
        child: Text("Cancel",
            style: TextStyle(fontSize: 15, color: Colors.red)),
      ),
    );
  }
}


