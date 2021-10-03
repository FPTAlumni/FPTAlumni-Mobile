import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uni_alumni/model/Alumni.dart';
import 'package:uni_alumni/screens/editprofile_screen.dart';
import 'package:uni_alumni/modules/alumni/widgets/alumni_button_widget.dart';
import 'package:uni_alumni/modules/alumni/widgets/alumni_profile_widget.dart';
import 'package:uni_alumni/modules/alumni/widgets/appbar_widget.dart';
import 'package:uni_alumni/shared/constants/assets.dart';
import 'package:uni_alumni/shared/constants/colors.dart';
import 'package:uni_alumni/shared/data/fake_data.dart';

class Profile extends StatelessWidget {
  String url =
      'https://i.pinimg.com/originals/48/a9/8a/48a98a3200a2fd9f857890aed4413357.jpg';
  String userAboutMe = "Keep moving forward";
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    return Scaffold(
      appBar: buildAppBar(context),
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(110),
      //   child: Container(
      //     color: ColorConstants.white,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Container(
      //           padding: EdgeInsets.only(
      //             top: 10,
      //             left: 15.0,
      //           ),
      //           margin: EdgeInsets.only(
      //             bottom: 10,
      //           ),
      //           child: Row(
      //             children: [
      //               Container(
      //                 margin: EdgeInsets.only(right: 15.0),
      //                 child: Image.asset(
      //                   AssetConstants.logo,
      //                   width: 40,
      //                 ),
      //               ),
      //               Text(
      //                 'ALUMNI',
      //                 style: TextStyle(
      //                   fontWeight: FontWeight.bold,
      //                   color: ColorConstants.primaryAppColor,
      //                   fontSize: 20,
      //                   fontFamily: 'Poppins',
      //                   letterSpacing: 3,
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(imagePath: url, onClicked: () async {}),
          const SizedBox(height: 24),
          buildName(user),
          const SizedBox(height: 24),
          Center(
            child: buildEditProfileButton(context),
          ),
          const SizedBox(height: 24),
          // NumbersWidget(),
          const SizedBox(height: 24),
          buildAbout(),
          const SizedBox(height: 24),
          const Divider(),
          Container(
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
                            "  Full-stack developer",
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
          ),
          const Divider(),
          Container(
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
                            "  Address",
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
          ),
          const Divider(),
          Container(
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
                            "  Phone",
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
          ),
          const Divider(),
          Container(
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
                            "  DOB",
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
          ),
        ],
      ),
    );
  }

  Widget buildName(Alumni user) => Column(
        children: [
          Text(
            user.fullName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(
              color: Colors.grey,
            ),
          )
        ],
      );

  Widget buildEditProfileButton(BuildContext context) => ButtonWidget(
        text: "Edit Profile",
        onClicked: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => EditProfilePage()),
          );
        },
      );

  Widget buildAbout() => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About me',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              userAboutMe,
              style: TextStyle(
                fontSize: 16,
                height: 1.4,
              ),
            ),
          ],
        ),
      );
}
