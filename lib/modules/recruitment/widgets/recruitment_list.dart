import 'package:flutter/material.dart';
import 'package:uni_alumni/modules/recruitment/widgets/recruitment_card.dart';

class RecruitmentList extends StatelessWidget {
  final String url =
      'https://cdn.pixabay.com/photo/2015/12/11/11/43/google-1088004_1280.png';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ListView(
        shrinkWrap: true,
        children: [
          RecruitmentCard(url),
          RecruitmentCard(url),
        ],
      ),
    );
  }
}
