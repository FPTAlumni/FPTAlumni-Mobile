import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:uni_alumni/models/event.dart';
import 'package:uni_alumni/modules/groups/controllers/group_controller.dart';
import 'package:uni_alumni/shared/constants/colors.dart';
import 'package:uni_alumni/shared/utils/format_utils.dart';

import '../event_controller.dart';

class EventDetailsScreen extends StatelessWidget {
  final controller = Get.find<EventController>();
  final groupController = Get.find<GroupController>();

  Event get event {
    return controller.event.value;
  }

  @override
  Widget build(BuildContext context) {
    final isRegistering = event.eventStatus == Event.registrationOpen ||
        event.eventStatus == Event.registered;

    PreferredSizeWidget _banner = PreferredSize(
      preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.35),
      child: Expanded(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(event.banner),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    PreferredSizeWidget _registrationPlace = PreferredSize(
      preferredSize: Size.fromHeight(kBottomNavigationBarHeight),
      child: Padding(
        padding: EdgeInsets.only(right: 16, left: 14, top: 16, bottom: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Registration End:",
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      FormatUtils.toddMMyyyyHHmm(event.registrationEndDate),
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Obx(
              () => GestureDetector(
                onTap: () {
                  if (!controller.event.value.inEvent) {
                    controller.joinEvent(event.id);
                    controller.event.value.inEvent = true;
                  } else {
                    controller.leaveEvent(event.id);
                    controller.event.value.inEvent = false;
                  }
                  controller.event.value.setStatus();
                  controller.event.refresh();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: controller.event.value.eventStatus ==
                                Event.registrationOpen
                            ? Colors.orange.shade300.withOpacity(0.5)
                            : Colors.grey.shade300.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 0),
                      ),
                    ],
                    color: controller.event.value.eventStatus ==
                            Event.registrationOpen
                        ? Colors.deepOrange
                        : Colors.grey[400],
                  ),
                  child: Text(
                    controller.event.value.eventStatus! ==
                            Event.registrationOpen
                        ? 'Register'
                        : 'Cancel',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.grey[800],
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.more_horiz,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _banner,
          Expanded(
            // height: MediaQuery.of(context).size.height -
            //     MediaQuery.of(context).padding.top -
            //     _banner.preferredSize.height -
            //     _registrationPlace.preferredSize.height -
            //     kBottomNavigationBarHeight,
            // color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 20,
                      top: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // if (controller.event.value.eventStatus !=
                              //     'Register')
                              Obx(() {
                                if (controller.event.value.eventStatus !=
                                    Event.registrationOpen) {
                                  return Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                        vertical: 8.0,
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: controller
                                                  .event.value.statusColor),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15.0))),
                                      child: Text(
                                          controller.event.value.eventStatus!,
                                          style: TextStyle(
                                              color: controller
                                                  .event.value.statusColor)),
                                    ),
                                  );
                                }
                                return const SizedBox();
                              }),
                              const SizedBox(height: 3),
                              Flexible(
                                child: Text(
                                  event.eventName,
                                  softWrap: true,
                                  style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.grey[600],
                                      size: 20,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      event.location,
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.group,
                                      color: Colors.grey[600],
                                      size: 20,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      event.groupName!,
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Event Timeline",
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        Column(
                          children: [
                            // _buildTimeline(
                            //   'Open Registration',
                            //   dateBefore: event.registrationStartDate,
                            //   dateAfter: event.registrationEndDate,
                            //   isFirst: true,
                            // ),
                            // _buildTimeline(
                            //   'Close Registration',
                            //   dateBefore: event.registrationEndDate,
                            //   dateAfter: event.startDate,
                            // ),
                            // _buildTimeline(
                            //   'Event Start',
                            //   dateBefore: event.startDate,
                            //   dateAfter: event.endDate,
                            // ),
                            // _buildTimeline(
                            //   'Event End',
                            //   dateBefore: event.endDate,
                            //   dateAfter: event.endDate,
                            //   isLast: true,
                            // ),
                            _buildEventFeature(
                              FormatUtils.toddMMyyyyHHmm(
                                  event.registrationStartDate),
                              "Registration Start",
                            ),
                            _buildEventFeature(
                              FormatUtils.toddMMyyyyHHmm(
                                  event.registrationEndDate),
                              "Registration End",
                            ),
                            _buildEventFeature(
                              FormatUtils.toddMMyyyyHHmm(event.startDate),
                              "Event Start",
                            ),
                            _buildEventFeature(
                              FormatUtils.toddMMyyyyHHmm(event.endDate),
                              "Event End",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "More detail",
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      event.eventContent,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          if (isRegistering) _registrationPlace,
        ],
      ),
    );
  }

  _buildEventFeature(String value, String feature) {
    return Container(
      width: double.infinity,
      height: 60,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 6.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.orange,
          width: 1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            feature,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 13,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  _buildTimeline(String title,
      {double height = 40,
      bool isFirst = false,
      bool isLast = false,
      required DateTime dateBefore,
      required DateTime dateAfter}) {
    DateTime now = DateTime.now().toUtc();
    bool isActive = (now.isAfter(dateBefore) && now.isBefore(dateAfter)) ||
        (now.isAfter(dateAfter) && dateBefore.isAtSameMomentAs(dateAfter));
    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      indicatorStyle: IndicatorStyle(
        width: 10,
        color: ColorConstants.primaryAppColor,
      ),
      beforeLineStyle: LineStyle(
        color: ColorConstants.lightPrimaryAppColor,
        thickness: 2.0,
      ),
      alignment: TimelineAlign.manual,
      lineXY: 0.4,
      startChild: _buildChild(
        FormatUtils.toddMMyy(dateBefore),
        height: height,
        color: isActive ? ColorConstants.primaryAppColor : Colors.black,
      ),
      endChild: _buildChild(
        title,
        isLeft: false,
        color: isActive ? ColorConstants.primaryAppColor : Colors.black,
      ),
    );
  }

  _buildChild(String text,
      {double height = 30, bool isLeft = true, Color color = Colors.black}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      alignment: isLeft ? Alignment.centerRight : Alignment.centerLeft,
      constraints: BoxConstraints(
        minHeight: height,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14,
          color: color,
        ),
      ),
    );
  }
}
