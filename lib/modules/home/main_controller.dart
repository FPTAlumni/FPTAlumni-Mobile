import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/home/tabs/event_tab.dart';
import 'package:uni_alumni/modules/home/tabs/tabs.dart';
import 'package:uni_alumni/routes/my_keys.dart';
import 'package:uni_alumni/routes/my_navigator.dart';
import 'package:uni_alumni/shared/utils/push_notification.dart';

class MainController extends GetxController {
  var currentTab = MainTabs.home.obs;

  late HomeTab homeTab;
  late RecruitmentTab recruitmentsTab;
  late ReferralTab referralTab;
  late MenuTab menuTab;

  MyKeys myKeys = new MyKeys();

  List<Widget> _pages = [];

  List<Widget> get pages {
    return [..._pages];
  }

  @override
  void onInit() {
    super.onInit();
    _pages = [
      MyNavigator(navigatorKey: myKeys.home, name: 'home', widget: HomeTab()),
      SizedBox(),
      SizedBox(),
      SizedBox(),
      SizedBox(),
    ];
    PushNotification()..initialize();
  }

  void switchTab(index) {
    var tab = _getCurrentTab(index);

    if (_pages[index] is SizedBox) {
      _createScreen(tab, index);
    }

    if (currentTab.value == tab) {
      _getKey(tab).currentState!.popUntil((route) => route.isFirst);
    }

    currentTab.value = tab;
  }

  GlobalKey<NavigatorState> _getKey(MainTabs tab) {
    switch (tab) {
      case MainTabs.home:
        return myKeys.home;
      case MainTabs.event:
        return myKeys.events;
      case MainTabs.recruitment:
        return myKeys.jobs;
      case MainTabs.referral:
        return myKeys.referral;
      case MainTabs.profile:
        return myKeys.profile;
    }
  }

  void _createScreen(MainTabs tab, index) {
    switch (tab) {
      case MainTabs.home:
        _pages[index] = MyNavigator(
            navigatorKey: myKeys.home, name: 'Home', widget: HomeTab());
        break;
      case MainTabs.event:
        _pages[index] = MyNavigator(
            navigatorKey: myKeys.events, name: 'Events', widget: EventTab());
        break;
      case MainTabs.recruitment:
        _pages[index] = MyNavigator(
            navigatorKey: myKeys.jobs, name: 'Jobs', widget: RecruitmentTab());
        break;
      case MainTabs.referral:
        _pages[index] = MyNavigator(
            navigatorKey: myKeys.referral,
            name: 'Referral',
            widget: ReferralTab());
        break;
      case MainTabs.profile:
        _pages[index] = MyNavigator(
            navigatorKey: myKeys.profile, name: 'Profile', widget: MenuTab());
        break;
    }
  }

  int getCurrentIndex(MainTabs tab) {
    switch (tab) {
      case MainTabs.home:
        return 0;
      case MainTabs.event:
        return 1;
      case MainTabs.recruitment:
        return 2;
      case MainTabs.referral:
        return 3;
      case MainTabs.profile:
        return 4;
      default:
        return 0;
    }
  }

  MainTabs _getCurrentTab(int index) {
    switch (index) {
      case 0:
        return MainTabs.home;
      case 1:
        return MainTabs.event;
      case 2:
        return MainTabs.recruitment;
      case 3:
        return MainTabs.referral;
      case 4:
        return MainTabs.profile;
      default:
        return MainTabs.home;
    }
  }
}
