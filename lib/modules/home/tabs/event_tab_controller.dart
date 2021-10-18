import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventTabController extends GetxController
    with SingleGetTickerProviderMixin {
  late final TabController controller;
  final List<Tab> eventTabs = [
    Tab(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        alignment: Alignment.center,
        child: Row(
          children: [
            Icon(Icons.event),
            const SizedBox(width: 3.0),
            Text("Upcoming"),
          ],
        ),
      ),
    ),
    Tab(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        alignment: Alignment.center,
        child: Row(
          children: [
            Icon(Icons.whatshot_rounded),
            const SizedBox(width: 3.0),
            Text("Your events"),
          ],
        ),
      ),
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    controller = TabController(length: eventTabs.length, vsync: this);
  }

  @override
  void onClose() {
    super.onClose();
    controller.dispose();
  }
}
