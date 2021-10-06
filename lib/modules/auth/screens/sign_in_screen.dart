import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/auth/auth_controller.dart';
import 'package:uni_alumni/modules/auth/widgets/background.dart';
import 'package:uni_alumni/shared/constants/assets.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class SignInScreen extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 5.0),
                    width: 90,
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Image.asset(
                        AssetConstants.logo,
                      ),
                    ),
                  ),
                  Text(
                    'ALUMNI',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.primaryAppColor,
                      fontSize: 30,
                      fontFamily: 'Poppins',
                      letterSpacing: 3,
                    ),
                  ),
                ],
              ),
            ),
            Form(
              key: controller.signInKey,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  left: 65,
                  right: 65,
                  bottom: 25,
                ),
                child: Obx(
                  () => DropdownButtonFormField<dynamic>(
                    validator: (value) {
                      if (value == null) return 'Please your university';
                      return null;
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF2F5233)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    hint: Text('Choose your university'),
                    value: controller.selectedUniversity.value == 0
                        ? null
                        : controller.selectedUniversity.value,
                    items: controller.dropdownUniversities.toList().cast(),
                    onChanged: (value) {
                      controller
                          .onChangeUniversity(int.parse(value.toString()));
                    },
                  ),
                ),
              ),
            ),
            Material(
              color: Colors.white,
              elevation: 5,
              borderRadius: BorderRadius.circular(15.0),
              child: InkWell(
                onTap: () {
                  controller.signIn();
                },
                // splashColor: ,
                borderRadius: BorderRadius.circular(15.0),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    left: 15,
                    right: 40,
                  ),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        child: AspectRatio(
                          aspectRatio: 1 / 1,
                          child: Image.asset(
                            'assets/images/google.png',
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Text(
                        'Sign in with Google',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
