import 'package:flutter/material.dart';
import 'package:uni_alumni/shared/widgets/sub_screen_app_bar.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SubScreenAppBar(),
      body: Container(
        child: Center(
          child: Text('News'),
        ),
      ),
    );
  }
}
