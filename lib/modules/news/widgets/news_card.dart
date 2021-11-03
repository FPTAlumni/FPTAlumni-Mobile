import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/models/news.dart';
import 'package:uni_alumni/modules/news/screens/news_details_screen.dart';
import 'package:uni_alumni/shared/constants/colors.dart';
import 'package:uni_alumni/shared/utils/format_utils.dart';
import 'package:uni_alumni/shared/widgets/my_chip.dart';

class NewsCard extends StatelessWidget {
  final String newsUrl =
      'https://img.timviec.com.vn/2020/09/tap-doan-fpt-1.jpg';
  final String avatar =
      'https://i.pinimg.com/originals/48/a9/8a/48a98a3200a2fd9f857890aed4413357.jpg';
  final News news;

  const NewsCard(this.news);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(
        top: 5.0,
        bottom: 5.0,
      ),
      color: ColorConstants.white,
      child: GestureDetector(
        onTap: () {
          Get.to(() => NewsDetailsScreen(news));
        },
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    right: 10.0,
                    left: 10.0,
                  ),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(news.group!.banner!),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        news.group!.groupName!,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        FormatUtils.toddMMyyyy(news.createdDate!),
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 7.0,
              ),
              child: Text(
                news.title!,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            AspectRatio(
              aspectRatio: 3 / 1,
              child: Container(
                child: Image.network(
                  news.banner!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            if (news.tags != null)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Wrap(
                        runSpacing: -20.0,
                        alignment: WrapAlignment.start,
                        children: news.tags!
                            .map(
                              (tag) => MyChip(
                                label: '#${tag.tagName}',
                                onTapHandler: () {},
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
