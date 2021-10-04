import 'package:flutter/material.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class AlumniIndex extends StatelessWidget {
  final String title;
  final Color color;
  final IconData icon;

  const AlumniIndex(this.title, this.color, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 110,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(10),


      child: Column(
        children: <Widget>[
          Row(
            children: [
              Icon(
                icon,
                color: ColorConstants.lightScaffoldBackgroundColor,
                size: 20.0,
              ),
              const SizedBox(height: 5),

            ],
          ),
          Row(
           children: [
             Container(
               child: Column(
                 children: <Widget>[
                   Text(
                     title,
                     style: TextStyle(
                       fontSize: 20,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                 ],
               ),
             ),
           ],
          ),
        ],
      ),

      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withOpacity(0.6),
            color,
          ],
          begin: Alignment.center,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(15),

      ),

    );
  }
}
