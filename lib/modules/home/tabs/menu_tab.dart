import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/models/alumni.dart';
import 'package:uni_alumni/modules/alumni/screens/edit_profile_screen.dart';
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
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
              child: Stack(
                children: [
                  buildImage(),
                ],
              ),
            ),
            const SizedBox(height: 24),
            buildName(context, authController.currentUser),
            const SizedBox(height: 24),
            buildAbout(context),

            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 18),
            buildCardInfor(context, Icons.phone,
                authController.currentUser?.phone ?? ''),

            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 18),
            buildCardInfor(context, Icons.work,
                authController.currentUser?.job ?? ''),

            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 18),
            buildCardInfor(context, Icons.map,
                authController.currentUser?.address ?? ''),

            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 18),
            // Column(
            //   children: [
            //     const Divider(),
            //     Flexible(
            //       child: buildCardInfor(context, Icons.phone,
            //           authController.currentUser?.phone ?? '')
            //     ),
            //     const Divider(),
            //     // Row(
            //     //   children: [
            //     //     buildCardInfor(context, Icons.work,
            //     //         authController.currentUser?.job ?? ''),
            //     //   ],
            //     // ),
            //     const Divider(),
            //     // Row(children: [
            //     //   buildCardInfor(context, Icons.map,
            //     //       authController.currentUser?.address ?? ''),
            //     // ]),
            //     const Divider(),
            //   ],
            // ),
            Container(
              constraints: BoxConstraints(maxWidth: 320.0, minHeight: 50.0),
              margin: EdgeInsets.all(10),
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(
                          builder: (ctx) => GroupHomeScreen()))
                      .then((_) => Get.delete<GroupController>());
                },
                splashColor: ColorConstants.white,
                color: Color(0xffFBB97C),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(children: [
                      Icon(Icons.group, size: 19, color: Colors.white),
                      SizedBox(width: 5),
                      Text(
                        "Groups",
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              fontSize: 19,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                            ),
                      ),
                    ]),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            Container(
              constraints: BoxConstraints(maxWidth: 320.0, minHeight: 50.0),
              margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditProfilePage()),
                  );
                },
                splashColor: ColorConstants.white,
                color: Color(0xffFBB97C),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(children: [
                      Icon(Icons.edit, size: 19, color: Colors.white),
                      SizedBox(width: 5),
                      Text(
                        "Edit Profile",
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              fontSize: 19,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                            ),
                      ),
                    ]),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              constraints: BoxConstraints(maxWidth: 320.0, minHeight: 50.0),
              margin: EdgeInsets.all(10),
              child: RaisedButton(
                onPressed: () async {
                  AuthController authController = Get.find();
                  await authController.logout();
                  Get.offNamedUntil(Routes.root, (route) => false);
                },
                splashColor: ColorConstants.white,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Sign out",
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontSize: 20,
                            color: Color(0xffFBB97C),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImage() {
    final image = NetworkImage(authController.currentUser?.image ?? url);
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(
            onTap: () {},
          ),
        ),
      ),
    );
  }

  Widget buildName(BuildContext context, Alumni? user) => Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Flexible(
              child: Text(
                user?.fullName ?? '',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
              ),
            ),
          ]),
          const SizedBox(height: 4),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Flexible(
              child: Text(
                user?.email ?? '',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 15,
                      color: Colors.grey,
                      fontFamily: 'Poppins',
                    ),
              ),
            ),
          ]),
          const SizedBox(height: 4),
        ],
      );
  Widget buildAbout(BuildContext context) => Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About me',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 16),

            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Flexible(
                child: Text(
                  authController.currentUser!.aboutMe!,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                      ),
                ),
              ),
            ]),
            // Text(
            //   authController.currentUser!.aboutMe!,
            //   style: TextStyle(
            //     fontSize: 16,
            //     height: 1.4,
            //   ),
            // ),
          ],
        ),
      );
  Widget buildCardInfor(BuildContext context, IconData icon, String infor) {
    return
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Icon(
                  icon,
                  color: ColorConstants.primaryAppColor,
                  size: 25.0,
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    "  " + infor,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ]),
            ],
          ),
        );

  }

  Widget buildAlumniCard(Widget widget) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(25),
      padding: EdgeInsets.all(10),
      height: 250,
      width: 100,
      child: widget,
    );
  }
}
