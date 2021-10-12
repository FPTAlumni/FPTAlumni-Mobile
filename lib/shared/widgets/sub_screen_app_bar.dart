import 'package:flutter/material.dart';
import 'package:uni_alumni/shared/constants/assets.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class SubScreenAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  SubScreenAppBar({required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.white,
      title: Text(title, style: TextStyle(color: Colors.black)),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      actions: actions,
    );
  }

  @override
  final Size preferredSize = Size.fromHeight(56.0);
}
