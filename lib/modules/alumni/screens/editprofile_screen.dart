import 'package:flutter/material.dart';
import 'package:uni_alumni/models/alumni.dart';
import 'package:uni_alumni/modules/alumni/widgets/alumni_profile_widget.dart';
import 'package:uni_alumni/modules/alumni/widgets/alumni_textfield_widget.dart';
import 'package:uni_alumni/modules/alumni/widgets/appbar_widget.dart';
import 'package:uni_alumni/shared/data/fake_data.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  Alumni user = UserPreferences.myUser;
  String url =
      'https://i.pinimg.com/originals/48/a9/8a/48a98a3200a2fd9f857890aed4413357.jpg';
  String userAboutMe = "Keep moving forward";
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: buildAppBar(context),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
            ProfileWidget(imagePath: url, onClicked: () async {}),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: "Full Name",
              text: user.fullName,
              onChanged: (name) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: "Email",
              text: user.email,
              onChanged: (name) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: "About me",
              maxLines: 5,
              text: userAboutMe,
              onChanged: (name) {},
            ),
          ],
        ),
      );
}
