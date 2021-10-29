import 'package:flutter/material.dart';

class SubScreenAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  SubScreenAppBar({required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.white,
      leadingWidth: 30,
      title: Text(
        title,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
        maxLines: 1,
        style: const TextStyle(color: Colors.black),
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      actions: actions,
    );
  }

  @override
  final Size preferredSize = Size.fromHeight(56.0);
}
