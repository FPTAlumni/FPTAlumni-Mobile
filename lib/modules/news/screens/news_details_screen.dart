import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:uni_alumni/shared/constants/colors.dart';
import 'package:uni_alumni/shared/widgets/my_chip.dart';
import 'package:uni_alumni/shared/widgets/sub_screen_app_bar.dart';

class NewsDetailScreen extends StatelessWidget {
  final String data = "<div>"
      "<p>This is a <strong>paragraph</strong>.</p>"
      "<h1>This is a title</h1>"
      "<p>This is a <strong>paragraph</strong>.</p>"
      "<p>This is a long, long, long very long paragraph to test overflow</p>"
      "<p>I like <i>dogs</i></p>"
      "<ul>"
      "<li>List item 1</li>"
      "<li>List item 2</li>"
      "<li>List item 3</li>"
      "</ul>"
      "<img style='width: 200px' src='https://www.kindacode"
      ".com/wp-content/uploads/2020/11/my-dog"
      ".jpg'>"
      "</div>";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
      appBar: SubScreenAppBar(
        title: 'Post title',
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 20.0,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      right: 10.0,
                      bottom: 0.0,
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
              Container(
                width: double.infinity,
                child: Wrap(
                  runSpacing: -12.0,
                  children: [
                    MyChip(label: '#K14', onTapHandler: () {}),
                    MyChip(label: '#Hot', onTapHandler: () {}),
                    MyChip(
                        label: '#Software Architecture', onTapHandler: () {}),
                    MyChip(label: '#Testing', onTapHandler: () {}),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                'This is a very very very very very long long long long long long title',
                softWrap: true,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10.0),
              AspectRatio(
                aspectRatio: 3 / 2,
                child: Container(
                  child: Image.network(
                    'https://img.timviec.com.vn/2020/09/tap-doan-fpt-1.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Html(
                data: data,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
