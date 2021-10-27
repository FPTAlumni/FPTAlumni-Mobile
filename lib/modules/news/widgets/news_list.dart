import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/news/news_controller.dart';
import 'package:uni_alumni/modules/news/news_repository.dart';
import 'package:uni_alumni/modules/news/widgets/news_card.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class NewsList extends StatelessWidget {
  final controller = Get.put(
      NewsController(newsRepository: NewsRepository(apiProvider: Get.find())));
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RefreshIndicator(
        onRefresh: () => controller.refresh(),
        child: Obx(() {
          if (controller.news.length == 0) {
            return Container(
              alignment: Alignment.center,
              child: Text(
                'There is no news for you',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }

          return ListView.builder(
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            controller: controller.scrollController,
            itemCount: controller.isLoading.value
                ? controller.news.length + 1
                : controller.news.length,
            itemBuilder: (ctx, i) {
              if (i == controller.news.length) {
                return Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: ColorConstants.primaryAppColor,
                    ),
                  ),
                );
              }
              return NewsCard(controller.news[i]);
            },
          );
        }),
      ),
    );
  }
}
