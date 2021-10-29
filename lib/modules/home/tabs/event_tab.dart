import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/events/event_controller.dart';
import 'package:uni_alumni/modules/events/widgets/upcoming_events.dart';
import 'package:uni_alumni/modules/events/widgets/your_events.dart';
import 'package:uni_alumni/modules/home/tabs/event_tab_controller.dart';
import 'package:uni_alumni/shared/constants/assets.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class EventTab extends StatelessWidget {
  final controller = Get.find<EventController>();
  final _eventTabs = Get.put(EventTabController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(right: 15.0),
              child: Image.asset(
                AssetConstants.logo,
                width: 40,
              ),
            ),
            Text(
              'EVENT',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: ColorConstants.primaryAppColor,
                fontSize: 20,
                fontFamily: 'Poppins',
                letterSpacing: 3,
              ),
            ),
          ],
        ),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        // _buildChipsRow(),
        _buildTabBar(context),
        _buildContent(context),
      ],
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
      ),
      child: Container(
        child: TabBar(
          isScrollable: true,
          unselectedLabelColor: Colors.redAccent,
          indicatorSize: TabBarIndicatorSize.label,
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          indicatorPadding: const EdgeInsets.symmetric(vertical: 5.0),
          indicator: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.redAccent, Colors.orangeAccent]),
              borderRadius: BorderRadius.circular(50),
              color: Colors.redAccent),
          controller: _eventTabs.controller,
          tabs: _eventTabs.eventTabs,
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Expanded(
      child: Container(
        // height: MediaQuery.of(context).size.height * 0.75,
        child: TabBarView(
          controller: _eventTabs.controller,
          children: [
            UpcomingEvents(),
            YourEvents(),
          ],
        ),
      ),
    );
  }
}
