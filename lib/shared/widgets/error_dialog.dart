import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorDialog {
  static showDialog({
    String title = 'Error!',
    String content = 'Some errors occurred',
  }) {
    return Get.defaultDialog(
      title: title,
      content: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        child: Text(content),
      ),
      cancel: TextButton(
        onPressed: () {
          Get.back();
        },
        child: Text('Close'),
      ),
    );
  }
}
