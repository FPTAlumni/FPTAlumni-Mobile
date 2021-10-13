import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui.dart';
import 'package:uni_alumni/modules/news/screens/news_details_screen.dart';
import 'package:uni_alumni/shared/constants/colors.dart';
import 'package:uni_alumni/shared/widgets/my_chip.dart';

class NewsCard extends StatelessWidget {
  final String newsUrl;
  final String avatar;
  final VoidCallback? onTapHandler;

  const NewsCard({
    required this.newsUrl,
    required this.avatar,
    this.onTapHandler,
  });

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
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => NewsDetailScreen()));
        },
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
                Expanded(
                  flex: 2,
                  child: Wrap(
                    runSpacing: -20.0,
                    alignment: WrapAlignment.end,
                    children: [
                      MyChip(label: '#K14', onTapHandler: () {}),
                      MyChip(
                          label: '#Software Architecture', onTapHandler: () {}),
                      MyChip(label: '#Hot', onTapHandler: () {}),
                      MyChip(label: '#Testing', onTapHandler: () {}),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
