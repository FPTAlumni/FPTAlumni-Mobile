import 'package:flutter/material.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class NewsCard extends StatelessWidget {
  final String newsUrl;
  final String avatar;

  const NewsCard({
    Key? key,
    required this.newsUrl,
    required this.avatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      elevation: 5,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 170,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image.network(
                  newsUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(avatar),
                  backgroundColor: Colors.transparent,
                ),
                const SizedBox(height: 5),
                Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'This is a long long long long long name',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        '25/09/2021',
                        style: TextStyle(
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                          color: ColorConstants.tipColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Text(
                  'This is a very very very very very long long long long long long title',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: OutlinedButton(
                onPressed: () {},
                child: Text('Details'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    ColorConstants.primaryAppColor,
                  ),
                  foregroundColor: MaterialStateProperty.all(
                    ColorConstants.lightScaffoldBackgroundColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
