import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uni_alumni/model/Alumni.dart';
import 'package:uni_alumni/modules/alumni/widgets/alumni_button_widget.dart';
import 'package:uni_alumni/modules/alumni/widgets/alumni_profile_widget.dart';
import 'package:uni_alumni/modules/alumni/widgets/appbar_widget.dart';
import 'package:uni_alumni/shared/constants/assets.dart';
import 'package:uni_alumni/shared/constants/colors.dart';
import 'package:uni_alumni/shared/data/fake_data.dart';

import 'editprofile_screen.dart';

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
          // NumbersWidget(),
          const SizedBox(height: 24),
          buildAbout(),
          const SizedBox(height: 24),
          buildAlumniCard(
            Column(
              children: [
                Row(
                  children: [buildCardInfor(Icons.phone, 'Contact')],
                ),
                const Divider(),
                Row(children: [buildCardInfor(Icons.work, 'Job'),],),
                const Divider(),
                Row(children: [buildCardInfor(Icons.map, 'Address'),]),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget buildCardInfor(IconData icon, String infor){
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Icon(
                icon,
                color: ColorConstants.primaryAppColor,
                size: 25.0,
              ),
              const SizedBox(height: 5),
              Container(
                // padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Text(
                      "  " + infor,
                      style: TextStyle(
                        fontSize: 15,
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
    );
  }


  //card alumni infor
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
