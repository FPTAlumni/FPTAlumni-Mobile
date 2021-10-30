import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/alumni/screens/profile_screen.dart';
import 'package:uni_alumni/modules/auth/auth_controller.dart';
import 'package:uni_alumni/modules/groups/controllers/group_controller.dart';
import 'package:uni_alumni/modules/groups/screens/group_home_screen.dart';
import 'package:uni_alumni/routes/app_pages.dart';
import 'package:uni_alumni/shared/constants/assets.dart';
import 'package:uni_alumni/shared/constants/colors.dart';
import 'package:uni_alumni/shared/card/alumni_card.dart';

class MenuTab extends StatelessWidget {
  final authController = Get.find<AuthController>();
  String url =
      'https://i.pinimg.com/originals/48/a9/8a/48a98a3200a2fd9f857890aed4413357.jpg';

  void selectProfile(BuildContext context) {
    // Navigator.of(context).push(MaterialPageRoute(builder: (_) {
    //   return Profile();
    // },),);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
  }

  @override
  Widget build(BuildContext context) {
    //bien nay la de tam thoi check role cho alumni
    bool isLeader = true;

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
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            InkWell(
              onTap: () => selectProfile(context),
              splashColor: ColorConstants.primaryAppColor,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(url),
                          backgroundColor: Colors.transparent,
                        ),
                        const SizedBox(height: 5),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Text(
                                " Hello, "
                                "${authController.currentUser?.fullName ?? ''}",
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            Container(
              width: 150,
              height: 300,
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AlumniIndex("Events", ColorConstants.primaryAppColor,
                          Icons.event),
                      AlumniIndex(
                          "Jobs", ColorConstants.primaryAppColor, Icons.work),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AlumniIndex("News", ColorConstants.primaryAppColor,
                          Icons.wallpaper),
                      AlumniIndex(
                        "Groups",
                        ColorConstants.primaryAppColor,
                        Icons.group,
                        onTapHandler: () {
                          // Get.to(() => GroupHome());
                          Navigator.of(context)
                              .push(MaterialPageRoute(
                                  builder: (ctx) => GroupHomeScreen()))
                              .then((_) => Get.delete<GroupController>());
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(),
            isLeader
                ? Container(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            Icon(
                              Icons.group,
                              color: ColorConstants.primaryAppColor,
                              size: 25.0,
                            ),
                            const SizedBox(height: 5),
                            Container(
                              padding: EdgeInsets.all(5),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    " Manage Groups",
                                    style: TextStyle(
                                      fontSize: 23,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(),
                          ],
                        ),
                      ],
                    ),
                  )
                : const Divider(),
            const Divider(),
            isLeader
                ? Container(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            Icon(
                              Icons.group_add,
                              color: ColorConstants.primaryAppColor,
                              size: 25.0,
                            ),
                            const SizedBox(height: 5),
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "  Manage Members",
                                    style: TextStyle(
                                      fontSize: 23,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(),
                          ],
                        ),
                      ],
                    ),
                  )
                : const Divider(),
            const Divider(),


            GestureDetector(
              onTap: () async {
                AuthController authController = Get.find();
                await authController.logout();
                Get.offNamedUntil(Routes.root, (route) => false);
              },
              child: Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_back_rounded,
                          color: ColorConstants.primaryAppColor,
                          size: 25.0,
                        ),
                        const SizedBox(height: 5),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Text(
                                " Sign out",
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}

ListTile _tile(String title, String subtitle) {
  return ListTile(
    title: Text(title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        )),
    subtitle: Text(subtitle),
  );
}

List<Widget> _buildHeader({required String title}) {
  return [
    Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    Divider(
      color: ColorConstants.primaryAppColor,
      thickness: 2,
    ),
  ];
}

Widget _buildCard({
  required String label,
  required BuildContext ctx,
  VoidCallback? onTapHandler,
}) {
  return Container(
    width: 150,
    height: 120,
    margin: EdgeInsets.all(5),
    child: Column(
      children: <Widget>[
        Container(
          width: 150,
          height: 90,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            margin: EdgeInsets.all(10),
            elevation: 5,
            // color: Color.fromRGBO(252, 216, 212, 1),
            // color: Theme.of(ctx).accentColor,
            child: Padding(
              padding: EdgeInsets.all(20),
            ),
          ),
        ),
        SizedBox(height: 2),
        FittedBox(
          child: Text(
            label,
            style: Theme.of(ctx).textTheme.headline6,
            softWrap: true,
            overflow: TextOverflow.fade,
          ),
        ),
      ],
    ),
  );
}
