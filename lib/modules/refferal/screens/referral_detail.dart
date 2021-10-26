import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/models/referral.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

import '../referral_controller.dart';

class ReferralDetail extends StatelessWidget {

  final Referral referral;
  final controller = Get.find<ReferralController>();

  ReferralDetail(this.referral);


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Referral", style: TextStyle(color: Colors.black))
        ),
        body: Stack(fit: StackFit.expand, children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                  Color.fromRGBO(4, 9, 35, 1),
                  Color.fromRGBO(39, 105, 171, 1),
                ],
                    begin: FractionalOffset.bottomCenter,
                    end: FractionalOffset.topCenter)),
          ),
          Scaffold(
              backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
              body: SingleChildScrollView(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                child: Column(children: [
                  Text(
                    'Profile',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      // fontFamily: ''
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: height * 0.4,
                    child: LayoutBuilder(builder: (context, constraints) {
                      double innerHeight = constraints.maxHeight;
                      double innerWidth = constraints.maxWidth;
                      return Stack(fit: StackFit.expand, children: [
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: innerHeight * 0.65,
                            width: innerWidth,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                            ),
                            child: Column(children: [
                              SizedBox(height: 45),
                              Text(
                                referral.fullName,
                                style: TextStyle(
                                    color:  Color.fromRGBO(39, 105, 171, 1),
                                    fontFamily: 'Nunito',
                                    fontSize: 30
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'Voucher',
                                        style: TextStyle(
                                          color: Colors.orange,
                                          fontFamily: 'Nunito',
                                          fontSize: 21,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        (referral.voucher.discountValue * 100).toString() + " %" ,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Nunito',
                                          fontSize: 21,
                                        ),
                                      ),
                                    ]
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 30
                                    ),
                                    child: Container(
                                      height: 40,
                                      width: 5,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        color: Colors.black,
                                      )
                                    ),
                                  ),
                                  Column(
                                      children: [
                                        Text(
                                          'Status',
                                          style: TextStyle(
                                            color: Colors.orange,
                                            fontFamily: 'Nunito',
                                            fontSize: 21,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Text(
                                          controller.statusName(referral.status),
                                          style: TextStyle(
                                            color: controller.changeColorStatus(referral.status),
                                            fontFamily: 'Nunito',
                                            fontSize: 21,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ]
                                  ),
                                ]
                              ),
                            ]),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Container(
                                width: innerWidth * 5,
                                height: innerHeight * 0.5,
                                  child:CircleAvatar(
                                    radius: 50,
                                    child: ClipOval(
                                      child: Image.asset(
                                        'assets/images/ava.jpg',
                                        height: 150,
                                        width: 150,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),

                            ),
                          ),
                        ),
                      ]);
                    }),
                  ),
                  SizedBox(height: 25),
                  SingleChildScrollView(
                    child: Container(
                      height: height * 0.35,
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children:[
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                            'Referral\'s Information',
                            style: TextStyle(
                              color: Color.fromRGBO(39, 105, 171, 1),
                              fontSize: 25,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.bold
                            )
                          ),
                            Divider(
                              thickness: 2.5,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                                children: [
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Icon(Icons.phone, color: Colors.orange, size: 30),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child: Text(
                                      referral.phone,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ]
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                                children: [
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Icon(Icons.map, color: Colors.orange, size: 30),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child: Text(
                                      referral.address,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ]
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                                children: [
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Icon(Icons.school, color: Colors.orange, size: 30),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child: Text(
                                      referral.highSchoolName.toString().isEmpty ?
                                      "Not fill yet": referral.highSchoolName.toString(),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ]
                            ),

                          ],
                        ),
                      )
                    ),
                  ),
                  SizedBox(height: 25),
                  SingleChildScrollView(
                    child: Container(
                      height: height * 0.3,
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children:[
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                            'More Information',
                            style: TextStyle(
                              color: Color.fromRGBO(39, 105, 171, 1),
                              fontSize: 25,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.bold
                            )
                          ),
                            Divider(
                              thickness: 2.5,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            //Parent
                            Row(
                                children: [
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Icon(Icons.person_sharp, color: Colors.orange, size: 30),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child: Text(
                                      referral.parentName.toString().isEmpty ?
                                      "Not fill yet": "(Mr./Ms.) " + referral.parentName.toString(),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ]
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                                children: [
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Icon(Icons.phone, color: Colors.orange, size: 30),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child: Text(
                                      referral.parentPhone.toString().isEmpty ?
                                      "Not fill yet": referral.parentPhone.toString(),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ]
                            ),
                          ],
                        ),
                      )
                    ),
                  ),
                ]),
              )))
        ]));
  }


  Widget buildCardInfor(IconData icon, String infor) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Icon(
                icon,
                color: ColorConstants.primaryAppColor,
                size: 30.0,
              ),
              const SizedBox(height: 5),
              Container(
                // padding: EdgeInsets.all(10),
                child: Column(
                    children: <Widget>[
                      // Text(
                      //   "  " + infor,
                      //   style: TextStyle(
                      //     fontSize: 20,
                      //   ),
                      //   overflow: TextOverflow.ellipsis,
                      //   maxLines: 2,
                      // ),

                    ],
                  ),
              ),
              const Divider(),
            ],
          ),
        ],
      ),
    );
  }
  Widget _buildText(String text) {
    return Container(
      margin: const EdgeInsets.only(
        top: 5.0,
        bottom: 5.0,
      ),
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style: Theme.of(Get.context!).textTheme.headline3!.copyWith(
          color: ColorConstants.black,
          fontSize: 20,
        ),
      ),
    );
  }
}
