import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/events/event_controller.dart';
import 'package:uni_alumni/modules/events/widgets/event_card.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class EventsList extends StatelessWidget {
  var list;
  final ScrollController scrollController;
  EventsList({required this.list, required this.scrollController, Key? key})
      : super(key: key);

  final eventController = Get.find<EventController>();
  // final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    // _scrollController.addListener(() {
    //   if (_scrollController.position.pixels ==
    //       _scrollController.position.maxScrollExtent) {
    //     eventController.getEventsOfCurrentAlumni().then((_) {
    //       if (eventController.error != null) {
    //         _scrollController
    //             .jumpTo(_scrollController.position.maxScrollExtent - 45);
    //       }
    //     });
    //   }
    // });

    return Container(
      width: double.infinity,
      child: RefreshIndicator(
        onRefresh: () => eventController.refreshUpcoming(),
        child: Obx(() {
          return Scrollbar(
            child: ListView.builder(
              key: key,
              controller: scrollController,
              itemCount: list.length + 1,
              itemBuilder: (ctx, i) {
                if (i == list.length) {
                  return Center(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: ColorConstants.primaryAppColor,
                      ),
                    ),
                  );
                }
                return EventCard(list[i]);
              },
            ),
          );
        }),
      ),
    );
  }
}
