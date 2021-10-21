import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class MoreInformation extends StatelessWidget {
  final _referralController = new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
        appBar: AppBar(
          leading: BackButton(color: Colors.black), 
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'More Information',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorConstants.primaryAppColor,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  letterSpacing: 3,
                ),
              ),
            ],
          ),
        ),
        body: PageView.builder(
          controller: _referralController,
          itemBuilder: (context, index) {
            return Column(children: <Widget>[
              Image.asset(
                'assets/images/alumni_background.jpg',
                width: 400,
                height: 250,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(height: 4),
              Expanded(
                child: Container(
                  width: 350,
                  decoration: BoxDecoration(
                    color: ColorConstants.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: SafeArea(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 11),
                        Text(
                          'The Alumni Referring Students Service',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 13),
                        Text(
                          'Let\'s more student become a member of \n our university  ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]);
          },
          itemCount: 1,
        ));
  }
}