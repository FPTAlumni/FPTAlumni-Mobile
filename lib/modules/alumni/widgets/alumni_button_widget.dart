
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class ButtonWidget extends StatelessWidget {

  final String text;
  final VoidCallback onClicked;

  const ButtonWidget(
  {
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => ElevatedButton(
    style: ElevatedButton.styleFrom(
      elevation: 10,
      shape: StadiumBorder(),
      primary: ColorConstants.primaryAppColor,
      onPrimary: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
    ),
    child: Text(text),
    onPressed: onClicked,
  );
}
