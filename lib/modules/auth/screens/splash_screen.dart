import 'package:flutter/material.dart';
import 'package:uni_alumni/modules/auth/widgets/background.dart';
import 'package:uni_alumni/shared/constants/assets.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 5.0),
                    width: 90,
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Image.asset(
                        AssetConstants.logo,
                      ),
                    ),
                  ),
                  Text(
                    'ALUMNI',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.primaryAppColor,
                      fontSize: 30,
                      fontFamily: 'Poppins',
                      letterSpacing: 3,
                    ),
                  ),
                ],
              ),
            ),
            CircularProgressIndicator(
              color: Color(0xFF2F5233),
            ),
          ],
        ),
      ),
    );
  }
}
