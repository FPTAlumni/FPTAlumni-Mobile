import 'package:get/get.dart';
import 'package:uni_alumni/modules/home/tabs/tabs.dart' show HomeTabs;

class HomeTabController extends GetxController {
  var selectedFilterList = [].obs;
  var currentTab = HomeTabs.news.obs;

  void onSwitchTab(int index) {
    currentTab.value = _getCurrentTab(index);
  }

  int getCurrentIndex(HomeTabs tab) {
    switch (tab) {
      case HomeTabs.news:
        return 0;
      case HomeTabs.events:
        return 1;
      default:
        return 0;
    }
  }

  HomeTabs _getCurrentTab(int index) {
    switch (index) {
      case 0:
        return HomeTabs.news;
      case 1:
        return HomeTabs.events;
      default:
        return HomeTabs.news;
    }
  }
}
