import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../event_controller.dart';
import 'event_card.dart';

class YourEvents extends StatelessWidget {
  final eventController = Get.find<EventController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RefreshIndicator(
        onRefresh: () => eventController.refreshYourEvents(),
        child: Obx(() {
          return Scrollbar(
            child: ListView.builder(
              key: PageStorageKey('yourEvents'),
              itemCount: eventController.myEvents.length,
              itemBuilder: (ctx, i) {
                return EventCard(eventController.myEvents[i]);
              },
            ),
          );
        }),
      ),
    );
  }
}
