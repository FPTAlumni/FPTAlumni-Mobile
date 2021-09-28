import 'package:flutter/material.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class NewsCard extends StatelessWidget {
  final String newsUrl;
  final String avatar;

  const NewsCard({
    required this.newsUrl,
    required this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(
        top: 5.0,
        bottom: 5.0,
      ),
      color: ColorConstants.lightGray,
      // decoration: BoxDecoration(
      //   color: ColorConstants.white,
      //   border: Border.symmetric(
      //     horizontal: BorderSide(
      //       color: ColorConstants.primaryAppColor,
      //       width: 2,
      //     ),
      //   ),
      // ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 7.0,
            ),
            child: Text(
              'This is a very very very very very long long long long long long title',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Image.network(newsUrl),
          ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(avatar),
              backgroundColor: Colors.transparent,
            ),
            title: Text(
              'Username',
              style: TextStyle(fontSize: 15),
            ),
            subtitle: Text('28/09/2021', style: TextStyle(fontSize: 13)),
            trailing: Container(
              width: 150,
              child: Text(
                'Group name is very very very very long long',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
