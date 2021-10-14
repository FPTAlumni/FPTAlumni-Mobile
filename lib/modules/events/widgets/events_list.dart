import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/events/event_controller.dart';
import 'package:uni_alumni/modules/events/event_repository.dart';
import 'package:uni_alumni/modules/events/widgets/event_card.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class EventsList extends StatelessWidget {
  final eventController = Get.put(EventController(
      eventRepository: EventRepository(apiProvider: Get.find())));
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        eventController.getEventsOfCurrentAlumni().then((_) {
          if (eventController.error != null) {
            _scrollController
                .jumpTo(_scrollController.position.maxScrollExtent - 50);
          }
        });
      }
    });
    return Container(
      width: double.infinity,
      child: RefreshIndicator(
        onRefresh: () => eventController.refresh(),
        child: Obx(() {
          return Scrollbar(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: eventController.events.length,
              itemBuilder: (ctx, i) {
                if (i == eventController.events.length - 1) {
                  if (eventController.error == null) {
                    return Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        width: 25,
                        child: CircularProgressIndicator(
                          color: ColorConstants.primaryAppColor,
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                }
                return EventCard(eventController.events[i]);
              },
            ),
          );
        }),
      ),
    );
  }
}
