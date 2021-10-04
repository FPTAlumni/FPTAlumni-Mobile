import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter/material.dart';
import 'package:uni_alumni/shared/constants/assets.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 15.0),
                  child: Image.asset(
                    AssetConstants.logo,
                    width: 60,
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
          // DropdownBelow(items: [], onChanged: (value) {}),
          InkWell(
            onTap: () {},
            child: Ink(
              color: Color(0xFFD93C29),
              child: Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  left: 15,
                  right: 30,
                ),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Icon(Icons.android), // <-- Use 'Image.asset(...)' here
                    SizedBox(width: 12),
                    Text(
                      'Sign in with Google',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
