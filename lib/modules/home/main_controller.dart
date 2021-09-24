import 'package:get/get.dart';
import 'package:uni_alumni/modules/home/tabs/tabs.dart';

class MainController extends GetxController {
  var currentTab = MainTabs.Home.obs;

  late HomeTab homeTab;
  late RecruitmentTab recruitmentsTab;
  late GroupsTab groupsTab;
  late MenuTab menuTab;

  @override
  void onInit() {
    super.onInit();
    homeTab = HomeTab();

    recruitmentsTab = RecruitmentTab();
    groupsTab = GroupsTab();
    menuTab = MenuTab();
  }

  void switchTab(index) {
    var tab = _getCurrentTab(index);
    currentTab.value = tab;
  }

  int getCurrentIndex(MainTabs tab) {
    switch (tab) {
      case MainTabs.Home:
        return 0;
      case MainTabs.Recruitment:
        return 1;
      case MainTabs.Groups:
        return 2;
      case MainTabs.Menu:
        return 3;
      default:
        return 0;
    }
  }

  MainTabs _getCurrentTab(int index) {
    switch (index) {
      case 0:
        return MainTabs.Home;
      case 1:
        return MainTabs.Recruitment;
      case 2:
        return MainTabs.Groups;
      case 3:
        return MainTabs.Menu;
      default:
        return MainTabs.Home;
    }
  }
}
