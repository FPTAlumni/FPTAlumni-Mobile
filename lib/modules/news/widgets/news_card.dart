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
          AspectRatio(
            aspectRatio: 3 / 1,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  alignment: FractionalOffset.topCenter,
                  image: NetworkImage(newsUrl),
                ),
              ),
              child: Image.network(
                newsUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 15.0,
                ),
                child: CircleAvatar(
                  radius: 22,
                  backgroundImage: NetworkImage(avatar),
                  backgroundColor: Colors.transparent,
                ),
              ),
              Column(
                children: [
                  Text(
                    'Username',
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    '28/09/2021',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              Spacer(),
              Expanded(
                flex: 2,
                child: Wrap(
                  alignment: WrapAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      child: Chip(
                        label: Text(
                          '#K14',
                          textScaleFactor: 5 / 6,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      child: Chip(
                        label: Text(
                          '#K14',
                          textScaleFactor: 5 / 6,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      child: Chip(
                        label: Text(
                          '#K14',
                          textScaleFactor: 5 / 6,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
