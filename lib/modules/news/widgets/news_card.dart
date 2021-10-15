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
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    right: 10.0,
                    left: 10.0,
                  ),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                        'https://i.pinimg.com/originals/48/a9/8a/48a98a3200a2fd9f857890aed4413357.jpg'),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Group name the very very long group name to test '
                        'over flow hehehe',
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
                        '28/09/2021',
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
                      children: [
                        MyChip(label: '#K14', onTapHandler: () {}),
                        MyChip(
                            label: '#Software Architecture',
                            onTapHandler: () {}),
                        MyChip(label: '#Hot', onTapHandler: () {}),
                        MyChip(label: '#Testing', onTapHandler: () {}),
                      ],
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
