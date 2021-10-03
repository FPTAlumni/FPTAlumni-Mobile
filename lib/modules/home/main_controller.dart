import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/home/tabs/tabs.dart';
import 'package:uni_alumni/routes/my_keys.dart';
import 'package:uni_alumni/routes/my_navigator.dart';

class MainController extends GetxController {
  var currentTab = MainTabs.home.obs;

  late HomeTab homeTab;
  late RecruitmentTab recruitmentsTab;
  late GroupsTab groupsTab;
  late MenuTab menuTab;

  List<Widget> _pages = [
    MyNavigator(navigatorKey: MyKeys.home, name: 'home', widget: HomeTab()),
    SizedBox(),
    SizedBox(),
    SizedBox(),
  ];

  List<Widget> get pages {
    return [..._pages];
  }

  @override
  void onInit() {
    super.onInit();
  }

  void switchTab(index) {
    var tab = _getCurrentTab(index);

    if (_pages[index] is SizedBox) {
      _createScreen(tab, index);
    }

    if (currentTab.value == tab) {
      MyKeys.home.currentState!.popUntil((route) => route.isFirst);
    }

    currentTab.value = tab;
  }

  void _createScreen(MainTabs tab, index) {
    switch (tab) {
      case MainTabs.home:
        _pages[index] = MyNavigator(
            navigatorKey: MyKeys.home, name: 'home', widget: HomeTab());
        break;
      case MainTabs.recruitment:
        _pages[index] = MyNavigator(
            navigatorKey: MyKeys.jobs, name: 'Jobs', widget: RecruitmentTab());
        break;
      case MainTabs.groups:
        _pages[index] = MyNavigator(
            navigatorKey: MyKeys.groups, name: 'Groups', widget: GroupsTab());
        break;
      case MainTabs.menu:
        _pages[index] = MyNavigator(
            navigatorKey: MyKeys.menu, name: 'Menu', widget: MenuTab());
        break;
    }
  }

  int getCurrentIndex(MainTabs tab) {
    switch (tab) {
      case MainTabs.home:
        return 0;
      case MainTabs.recruitment:
        return 1;
      case MainTabs.groups:
        return 2;
      case MainTabs.menu:
        return 3;
      default:
        return 0;
    }
  }

  MainTabs _getCurrentTab(int index) {
    switch (index) {
      case 0:
        return MainTabs.home;
      case 1:
        return MainTabs.recruitment;
      case 2:
        return MainTabs.groups;
      case 3:
        return MainTabs.menu;
      default:
        return MainTabs.home;
    }
  }
}
