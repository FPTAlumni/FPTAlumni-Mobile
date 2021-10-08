import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/events/event_controller.dart';
import 'package:uni_alumni/modules/events/event_repository.dart';
import 'package:uni_alumni/modules/events/widgets/event_card.dart';

class EventsList extends StatelessWidget {
  final eventController = Get.put(EventController(
      eventRepository: EventRepository(apiProvider: Get.find())));
  final String eventUrl =
      'https://media.13newsnow.com/assets/WVEC/images/34af2191-3ac8-4b97-8631'
      '-bbeb6425d04e/34af2191-3ac8-4b97-8631-bbeb6425d04e_1140x641.jpeg';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ListView.builder(
        itemCount: eventController.events.length,
        itemBuilder: (ctx, i) => EventCard(eventController.events[i]),
      ),
    );
  }
}
