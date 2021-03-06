import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/groups/screens/group_home_screen.dart';
import 'package:uni_alumni/modules/home/controllers/home_controller.dart';
import 'package:uni_alumni/modules/home/widgets/home_posts_list.dart';
import 'package:uni_alumni/shared/constants/assets.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class HomeTab extends StatelessWidget {
  HomeTab({Key? key}) : super(key: key);

  final controller = Get.find<HomeController>();

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
            Obx(
              () => Text(
                controller.isHome.value ? 'HOME' : 'GROUPS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorConstants.primaryAppColor,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  letterSpacing: 3,
                ),
              ),
            ),
          ],
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorConstants.lightPrimaryAppColor,
            ),
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.only(
              right: 10,
            ),
            child: GestureDetector(
              onTap: () {
                controller.onHomeGroupToggle();
                // final controller = Get.find<NewsController>();
                // controller.showFilter();
              },
              child: Obx(
                () => Container(
                  width: 25,
                  child: Icon(
                    controller.isHome.value ? Icons.group : Icons.home,
                    color: Colors.white,
                    size: 22,
                  ),
                  // AspectRatio(
                  //   aspectRatio: 1 / 1,
                  //   child: Image.asset(
                  //     'assets/images/filter.png',
                  //     color: Colors.white,
                  //   ),
                  // ),
                ),
              ),
            ),
          ),
        ],
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Obx(
          () => controller.isHome.value ? HomePostsList() : GroupHomeScreen()),
    );
  }
}
