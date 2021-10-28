import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/home/main_controller.dart';
import 'package:uni_alumni/modules/home/main_screen.dart';
import 'package:uni_alumni/modules/home/tabs/tabs.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class PushNotification {
  late FirebaseMessaging _fcm;

  PushNotification() {
    // To create a new Messaging instance
    _fcm = FirebaseMessaging.instance;
  }

  Future initialize() async {
    // requestPermission
    NotificationSettings settings = await _fcm.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true);
    print('User granted permission: ${settings.authorizationStatus}');

    // To listen to messages whilst your application is in the foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Message data: ${message.data}');
      showDialog(message);

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });

    // Handling background  messages when touch notification
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('onMessageOpenedApp: ${message.data}');
      showDialog(message);
    });
  }

  // Dialog show message and navigator to referral Tab.
  void showDialog(message) {
    Map<String, dynamic> data = message.data;
    MainController controller = Get.find<MainController>();

    Get.defaultDialog(
      title: '${data['title']}',
      content: Column(
        children: [
          Text("${data['content']}"),
        ],
      ),
      textConfirm: 'Go to Referral',
      textCancel: 'Close',
      cancelTextColor: Colors.black,
      confirmTextColor: ColorConstants.primaryAppColor,
      barrierDismissible: false,
      buttonColor: Colors.transparent,
      titlePadding: const EdgeInsets.all(10),
      onConfirm: () {
        controller.switchTab(3);
        Get.until((route) => route.isFirst);
      },
    );
  }
}
