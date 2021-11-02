import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/events/event_controller.dart';
import 'package:uni_alumni/modules/events/widgets/event_card.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class EventsList extends StatelessWidget {
  var list;
  final ScrollController scrollController;
  var isLoading;
  EventsList({
    required this.list,
    required this.scrollController,
    this.isLoading,
    Key? key,
  }) : super(key: key);

  final eventController = Get.find<EventController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RefreshIndicator(
        onRefresh: () => eventController.refreshUpcoming(),
        child: Obx(() {
          if (list.length == 0) {
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

          return Scrollbar(
            child: ListView.builder(
              key: key,
              physics: BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              controller: scrollController,
              itemCount: isLoading.value ? list.length + 1 : list.length,
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
