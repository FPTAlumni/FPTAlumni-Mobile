import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/auth/auth_controller.dart';
import 'package:uni_alumni/modules/auth/screens/sign_in_screen.dart';
import 'package:uni_alumni/modules/auth/screens/splash_screen.dart';
import 'package:uni_alumni/modules/home/main_screen.dart';

class RootApp extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isSignIn.value
          ? MainScreen()
          : FutureBuilder(
              future: controller.autoSignIn,
              builder: (ctx, authResultSnapshot) =>
                  authResultSnapshot.connectionState == ConnectionState.waiting
                      ? SplashScreen()
                      : SignInScreen());
    });
    // return MainScreen() ;
  }
}
