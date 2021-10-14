import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class MyChip extends StatelessWidget {
  final String label;
  final VoidCallback onTapHandler;
  final Color color;
  final Color? background;
  final double margin;
  final Widget? icon;

  MyChip(
      {required this.label,
      required this.onTapHandler,
      this.color = Colors.white,
      this.background = ColorConstants.lightPrimaryAppColor,
      this.icon,
      this.margin = 5.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin),
      child: ActionChip(
          avatar: icon,
          label: Text(
            label,
            textScaleFactor: 5 / 6,
          ),
          backgroundColor: background,
          labelStyle: TextStyle(color: color),
          onPressed: onTapHandler),
    );
  }
}
