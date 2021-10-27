import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorDialog {
  static showDialog({
    String title = 'Error!',
    String content = 'Some errors occurred',
  }) {
    Get.defaultDialog(
      title: title,
      content: Text(content),
      cancel: TextButton(
        onPressed: () {
          Get.back();
        },
        child: Text('Close'),
      ),
    );
  }
}
