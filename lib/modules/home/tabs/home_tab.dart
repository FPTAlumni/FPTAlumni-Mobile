import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uni_alumni/modules/event/widgets/event_card.dart';
import 'package:uni_alumni/modules/news/widgets/news_card.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class HomeTab extends StatelessWidget {
  final String newsUrl =
      'https://img.timviec.com.vn/2020/09/tap-doan-fpt-1.jpg';
  final String avatar =
      'https://i.pinimg.com/originals/48/a9/8a/48a98a3200a2fd9f857890aed4413357.jpg';
  final String eventUrl =
      'https://media.13newsnow.com/assets/WVEC/images/34af2191-3ac8-4b97-8631'
      '-bbeb6425d04e/34af2191-3ac8-4b97-8631-bbeb6425d04e_1140x641.jpeg';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          ..._buildHeader(title: 'News'),
          Container(
            height: 340,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                NewsCard(newsUrl: newsUrl, avatar: avatar),
                NewsCard(newsUrl: newsUrl, avatar: avatar),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ..._buildHeader(title: 'Events'),
          Container(
            height: 380,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                EventCard(eventUrl: eventUrl),
                EventCard(eventUrl: eventUrl),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildHeader({required String title}) {
    return [
      Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      Divider(
        color: ColorConstants.primaryAppColor,
        thickness: 2,
      ),
    ];
  }
}
