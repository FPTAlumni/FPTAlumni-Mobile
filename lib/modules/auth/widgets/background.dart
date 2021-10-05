import 'package:flutter/material.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class Background extends StatelessWidget {
  final Widget child;

  Background({required this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              'assets/images/top1.png',
              width: size.width,
              color: ColorConstants.primaryAppColor,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              'assets/images/top2.png',
              width: size.width,
              color: ColorConstants.primaryAppColor,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/images/bottom1.png',
              width: size.width,
              color: ColorConstants.primaryAppColor,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/images/bottom2.png',
              width: size.width,
              color: ColorConstants.primaryAppColor,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
