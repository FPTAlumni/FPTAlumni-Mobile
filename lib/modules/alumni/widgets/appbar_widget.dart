import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context){

  final icon = CupertinoIcons.square_arrow_right;

  return AppBar(
    leading: BackButton(color: Colors.black),
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(
          icon: Icon(icon, color: Colors.black),
          onPressed: () {},
        ),
      ],
  );
}


