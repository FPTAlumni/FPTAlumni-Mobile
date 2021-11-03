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
          if (eventController.myEvents.length == 0) {
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    alignment: Alignment.center,
                    child: Text(
                      'There is no event for you',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            key: PageStorageKey('yourEvents'),
            itemCount: eventController.myEvents.length,
            itemBuilder: (ctx, i) {
              return EventCard(eventController.myEvents[i]);
            },
          );
        }),
      ),
    );
  }
}
