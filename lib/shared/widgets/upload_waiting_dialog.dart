import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/shared/constants/colors.dart';


class UploadWaitingDialog {
  static void showDialog(String text) {
    Get.defaultDialog(
      title: '',
      content: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        child: Column(
          children: [
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(ColorConstants.primaryAppColor),
            ),
            const SizedBox(height: 20.0),
            Text(text),
          ],
        ),
      ),
      onWillPop: () async => false,
      barrierDismissible: false,
    );
  }

  static void cancelDialog() {
    Get.back();
  }
}
