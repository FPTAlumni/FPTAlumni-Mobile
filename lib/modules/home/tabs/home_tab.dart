import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/events/screens/create_event_screen.dart';
import 'package:uni_alumni/modules/events/widgets/events_list.dart';
import 'package:uni_alumni/modules/home/tabs/home_tab_controller.dart';
import 'package:uni_alumni/modules/home/tabs/tabs.dart';
import 'package:uni_alumni/modules/news/screens/news_details_screen.dart';
import 'package:uni_alumni/modules/news/widgets/news_list.dart';
import 'package:uni_alumni/shared/constants/assets.dart';
import 'package:uni_alumni/shared/constants/colors.dart';
import 'package:uni_alumni/shared/data/filters.dart';
import 'package:uni_alumni/shared/utils/filter_dialog.dart';

class HomeTab extends StatelessWidget {
  final HomeTabController controller = Get.put(HomeTabController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(110),
          child: Container(
            color: ColorConstants.white,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top + 5,
                        left: 15.0,
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 15.0),
                            child: Image.asset(
                              AssetConstants.logo,
                              width: 40,
                            ),
                          ),
                          Text(
                            'ALUMNI',
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
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top + 10,
                      ),
                      child: Row(
                        children: [
                          Obx(() {
                            if (controller.currentTab.value != HomeTabs.news) {
                              return Container();
                            }
                            return ClipOval(
                              child: Material(
                                elevation: 2.0,
                                color: ColorConstants.lightPrimaryAppColor,
                                child: InkWell(
                                  splashColor:
                                      Color.fromRGBO(128, 128, 128, 0.6),
                                  onTap: () async {
                                    FilterDialog dialog = FilterDialog();
                                    await dialog.showDialog(
                                        context: context,
                                        filtersData: FiltersData.newsTagFilters,
                                        selectedFilters: controller
                                            .selectedFilterList
                                            .toList()
                                            .cast<String>());
                                    controller.selectedFilterList.value =
                                        dialog.filterList;
                                  },
                                  child: SizedBox(
                                    width: 35,
                                    height: 35,
                                    child: Container(
                                      child: Image.asset(
                                        AssetConstants.filter,
                                        color: Colors.white70,
                                      ),
                                      padding: const EdgeInsets.all(5.0),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                          const SizedBox(width: 8),
                          // ClipOval(
                          //   child: Material(
                          //     elevation: 2.0,
                          //     color: ColorConstants.lightPrimaryAppColor,
                          //     child: PopupMenuButton(
                          //       onSelected: (index) {
                          //         if (index == 0) {
                          //           Navigator.of(context).push(
                          //               MaterialPageRoute(
                          //                   builder: (ctx) => NewsScreen()));
                          //         } else {
                          //           Navigator.of(context).push(
                          //               MaterialPageRoute(
                          //                   builder: (ctx) =>
                          //                       CreateEventScreen()));
                          //         }
                          //       },
                          //       child: Padding(
                          //         padding: const EdgeInsets.all(5.0),
                          //         child: Icon(
                          //           Icons.add,
                          //           color: Colors.white70,
                          //           size: 25,
                          //         ),
                          //       ),
                          //       itemBuilder: (context) => [
                          //         const PopupMenuItem(
                          //           child: ListTile(
                          //             leading: Icon(Icons.article),
                          //             title: Text('Create News'),
                          //           ),
                          //           value: 0,
                          //         ),
                          //         const PopupMenuItem(
                          //           child: ListTile(
                          //             leading: Icon(Icons.event),
                          //             title: Text('Create an Event'),
                          //           ),
                          //           value: 1,
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          // const SizedBox(width: 8),
                        ],
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: TabBar(
                    onTap: (index) {
                      controller.onSwitchTab(index);
                    },
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
