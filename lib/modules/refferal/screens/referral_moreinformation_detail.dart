import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/refferal/screens/referral_moreinformation.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class DetailPage extends StatelessWidget {
  final Service service;
  DetailPage(this.service);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: SingleChildScrollView(
          child: Column(children: [
        MyHeader(service.imageUrl),
        PlaceName(service.title, service.subtitle),
        AboutService(service),
            SizedBox(height: 50)
      ])),
    );
  }
}

class MyHeader extends StatelessWidget {
  final String imageUrl;
  MyHeader(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover),
      ),
      child: Stack(children: [
        Positioned(
          right: MediaQuery.of(context).padding.right,
          top: MediaQuery.of(context).padding.top,
          child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                decoration: BoxDecoration(
                ),
                padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                child: Icon(Icons.close_rounded, color: Colors.black, size: 45),
              )),
        ),
      ]),
    );
  }
}

class PlaceName extends StatelessWidget {
  final String title;
  final String subTitle;

  PlaceName(this.title, this.subTitle);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 30, bottom: 20, left: 30, right: 30),
        decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(36),
              bottomRight: Radius.circular(36),
            )),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(title,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    )),
                Text(subTitle,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Poppins',
                    )),
              ]),
              Row(children: []),
            ]));
  }
}

//about
class AboutService extends StatelessWidget {
  final Service service;
  AboutService(this.service);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        margin: EdgeInsets.only(top: 30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('About',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              )),
          SizedBox(height: 20),
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.headline4,
              children: <TextSpan>[
                TextSpan(
                  text:
                  service.content,
                  style: TextStyle(
                    fontSize: 25,
                    height: 1.5,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Divider(thickness: 1, color: Colors.black),
          SizedBox(height: 20),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:[
                Icon(FontAwesomeIcons.facebook, color: Colors.blue, size: 40),
                Icon(FontAwesomeIcons.facebookMessenger, color: Colors.deepOrange, size: 40),
                Icon(FontAwesomeIcons.mailBulk, color: Colors.green.shade500, size: 40),
              ]
            ),



        ]));
  }
}
