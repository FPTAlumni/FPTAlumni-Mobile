import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/events/event_controller.dart';
import 'package:uni_alumni/modules/events/widgets/events_list.dart';

class UpcomingEvents extends StatelessWidget {
  final eventController = Get.find<EventController>();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        eventController.getEventsOfCurrentAlumni().then((_) {
          if (eventController.error != null) {
            _scrollController
                .jumpTo(_scrollController.position.maxScrollExtent - 45);
          }
        });
      }
    });

    return EventsList(
      list: eventController.events,
      scrollController: _scrollController,
      key: PageStorageKey('upcomingEvents'),
    );
  }
}
