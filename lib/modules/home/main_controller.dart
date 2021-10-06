import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/home/tabs/tabs.dart';
import 'package:uni_alumni/routes/my_keys.dart';
import 'package:uni_alumni/routes/my_navigator.dart';

class MainController extends GetxController {
  var currentTab = MainTabs.home.obs;

  late HomeTab homeTab;
  late RecruitmentTab recruitmentsTab;
  late ReferralTab referralTab;
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
      _getKey(tab).currentState!.popUntil((route) => route.isFirst);
    }

    currentTab.value = tab;
  }

  GlobalKey<NavigatorState> _getKey(MainTabs tab) {
    switch (tab) {
      case MainTabs.home:
        return MyKeys.home;
      case MainTabs.recruitment:
        return MyKeys.jobs;
      case MainTabs.referral:
        return MyKeys.referral;
      case MainTabs.profile:
        return MyKeys.profile;
    }
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
      case MainTabs.referral:
        _pages[index] = MyNavigator(
            navigatorKey: MyKeys.referral,
            name: 'Referral',
            widget: ReferralTab());
        break;
      case MainTabs.profile:
        _pages[index] = MyNavigator(
            navigatorKey: MyKeys.profile, name: 'Profile', widget: MenuTab());
        break;
    }
  }

  int getCurrentIndex(MainTabs tab) {
    switch (tab) {
      case MainTabs.home:
        return 0;
      case MainTabs.recruitment:
        return 1;
      case MainTabs.referral:
        return 2;
      case MainTabs.profile:
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
        return MainTabs.referral;
      case 3:
        return MainTabs.profile;
      default:
        return MainTabs.home;
    }
  }
}
