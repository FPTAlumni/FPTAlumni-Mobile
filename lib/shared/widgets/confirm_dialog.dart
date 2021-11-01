import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      content: Text(msg),
      confirm: TextButton(
          onPressed: () {
            Get.back(result: true);
          },
          child: Text('Confirm')),
      cancel: TextButton(
        onPressed: () {
          Get.back();
        },
        child: Text('Cancel'),
      ),
    );
  }
}
