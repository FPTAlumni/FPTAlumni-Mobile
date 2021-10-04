import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:uni_alumni/modules/alumni/screens/profile_screen.dart';
import 'package:uni_alumni/shared/constants/assets.dart';
import 'package:uni_alumni/shared/constants/colors.dart';
import 'package:uni_alumni/shared/card/alumni_card.dart';

class MenuTab extends StatelessWidget {
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110),
        child: Container(
          height: 110 - MediaQuery.of(context).padding.top - 5,
          color: ColorConstants.white,
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 10,
            left: 15.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
            ],
          ),
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
                                " Hello,  Ageha Chou",
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
                      // AlumniIndex(" Referral", ColorConstants.primaryAppColor, Icons.person_add_alt),
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
            Container(
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
