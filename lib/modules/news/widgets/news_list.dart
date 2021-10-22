import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/news/news_controller.dart';
import 'package:uni_alumni/modules/news/news_repository.dart';
import 'package:uni_alumni/modules/news/widgets/news_card.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class NewsList extends StatelessWidget {
  final controller = Get.put(
      NewsController(newsRepository: NewsRepository(apiProvider: Get.find())));
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        controller.getNewsOfCurrentAlumni().then((_) {
          if (controller.error != null) {
            _scrollController
                .jumpTo(_scrollController.position.maxScrollExtent - 45);
          }
        });
      }
    });

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
            physics: BouncingScrollPhysics(),
            controller: _scrollController,
            itemCount: controller.news.length + 1,
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
