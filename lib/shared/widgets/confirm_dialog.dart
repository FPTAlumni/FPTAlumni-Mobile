import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class ConfirmDialog {
  ///Show confirm dialog
  ///
  ///Return true if choose 'Confirm'
  ///
  ///Return null if Cancel or dismiss
  static Future<bool?> showDialog(
      {String title = 'Confirmation', required String msg}) {
    return Get.defaultDialog(
      title: title,
      content: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          child: Text(msg)),
      confirm: TextButton(
        onPressed: () {
          Get.back(result: true);
        },
        child: Text(
          'Confirm',
          style: TextStyle(color: ColorConstants.primaryAppColor),
        ),
      ),
      cancel: TextButton(
        onPressed: () {
          Get.back();
        },
        child: Text('Cancel'),
      ),
    );
  }
}
