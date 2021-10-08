import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:uni_alumni/models/news.dart';
import 'package:uni_alumni/modules/news/news_controller.dart';
import 'package:uni_alumni/modules/news/widgets/news_card.dart';

class NewsList extends GetView<NewsController> {
  final String newsUrl =
      'https://img.timviec.com.vn/2020/09/tap-doan-fpt-1.jpg';
  final String avatar =
      'https://i.pinimg.com/originals/48/a9/8a/48a98a3200a2fd9f857890aed4413357.jpg';

  @override
  Widget build(BuildContext context) {
    // List<News> list = controller.newsRepositories.getNews() as List<News>;
    return Container(
      width: double.infinity,
      child: ListView(
        shrinkWrap: true,
        children: [
          NewsCard(newsUrl: newsUrl, avatar: avatar),
          NewsCard(newsUrl: newsUrl, avatar: avatar),
        ],
      ),
    );
  }
}
