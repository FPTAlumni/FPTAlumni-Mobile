import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/models/event.dart';
import 'package:uni_alumni/models/group.dart';
import 'package:uni_alumni/modules/groups/group_controller.dart';
import 'package:uni_alumni/shared/constants/colors.dart';
import 'package:uni_alumni/shared/utils/format_utils.dart';

import '../event_controller.dart';

class EventDetailsScreen extends StatelessWidget {
  final controller = Get.find<EventController>();
  final groupController = Get.find<GroupController>();

  @override
  Widget build(BuildContext context) {
    final Event event = controller.event.value;
    final isRegistering =
        event.eventStatus == "Register" || event.eventStatus == 'Registered';

    PreferredSizeWidget _banner = PreferredSize(
      preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.35),
      child: Expanded(
        child: Stack(
          children: [
            Hero(
              tag: '${event.id}',
              child: Container(
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
                // UserAvatar(),
                SizedBox(
                  width: 12,
                ),
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
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      FormatUtils.toddMMyyyyHHmmaaa(event.registrationEndDate),
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            if (isRegistering)
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
                    controller.event.value.getStatusString();
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
                          color:
                              controller.event.value.eventStatus == 'Register'
                                  ? Colors.orange.shade300.withOpacity(0.5)
                                  : Colors.grey.shade300.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(0, 0),
                        ),
                      ],
                      color: controller.event.value.eventStatus == 'Register'
                          ? Colors.deepOrange
                          : Colors.grey[400],
                    ),
                    child: Text(
                      controller.event.value.eventStatus!,
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

    return FutureBuilder(
      future: groupController.getGroupById(event.groupId),
      builder: (ctx, snapshot) {
        if (snapshot.hasError) {
          Get.back();
          return Container();
        }
        if (!snapshot.hasData) {
          return Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              width: 40,
              height: 40,
              child: CircularProgressIndicator(
                color: ColorConstants.primaryAppColor,
              ),
            ),
          );
        }

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
                          left: 20,
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
                                        'Register') {
                                      return Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0,
                                            vertical: 8.0,
                                          ),
                                          decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0))),
                                          child: Text(controller
                                              .event.value.eventStatus!),
                                        ),
                                      );
                                    }
                                    return Container();
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
                                  Row(
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
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.group,
                                        color: Colors.grey[600],
                                        size: 20,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        (snapshot.data as Group).groupName!,
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          children: [
                            _buildEventFeature(
                              FormatUtils.toddMMyyyyHHmmaaa(
                                  event.registrationStartDate),
                              "Registration Start",
                            ),
                            _buildEventFeature(
                              FormatUtils.toddMMyyyyHHmmaaa(event.startDate),
                              "Event Start",
                            ),
                            _buildEventFeature(
                              FormatUtils.toddMMyyyyHHmmaaa(event.endDate),
                              "Event End",
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
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ),
              _registrationPlace,
            ],
          ),
        );
      },
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
}
