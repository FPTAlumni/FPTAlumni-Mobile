import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uni_alumni/modules/event/widgets/events_list.dart';
import 'package:uni_alumni/modules/news/widgets/news_list.dart';
import 'package:uni_alumni/shared/constants/assets.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(229, 229, 229, 1),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(110),
          child: Container(
            color: ColorConstants.white,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 25.0),
                  child: ListTile(
                    title: Text(
                      'ALUMNI',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ColorConstants.primaryAppColor,
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        letterSpacing: 3,
                      ),
                    ),
                    leading: Image.asset(
                      AssetConstants.logo,
                      width: 40,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: TabBar(
                    labelColor: ColorConstants.black,
                    unselectedLabelColor: ColorConstants.tipColor,
                    unselectedLabelStyle: TextStyle(
                      fontSize: 16,
                    ),
                    indicatorColor: ColorConstants.primaryAppColor,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelStyle: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.primaryAppColor,
                    ),
                    // indicator: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(20),
                    //   color: ColorConstants.secondaryAppColor,
                    // ),
                    tabs: [
                      Tab(text: 'News'),
                      Tab(text: 'Events'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            NewsList(),
            EventsList(),
          ],
        ),
      ),
    );
  }
}
