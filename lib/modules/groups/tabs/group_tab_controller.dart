import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupTabController extends GetxController
    with SingleGetTickerProviderMixin {
  late final TabController controller;
  final List<Tab> groupTabs = [
    Tab(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        alignment: Alignment.center,
        child: Row(
          children: [
            Icon(Icons.group),
            const SizedBox(width: 3.0),
            Text("Your group"),
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
            Text("Discover"),
          ],
        ),
      ),
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    controller = TabController(length: groupTabs.length, vsync: this);
  }

  @override
  void onClose() {
    super.onClose();
    controller.dispose();
  }
}
