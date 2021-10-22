import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/recruitment/widgets/recruitment_card.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class RecruitmentList extends StatelessWidget {
  var list;
  final ScrollController scrollController;
  RefreshCallback onRefresh;

  RecruitmentList({
    required this.list,
    required this.scrollController,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RefreshIndicator(
        onRefresh: onRefresh,
        child: Obx(() {
          if (list.length == 0) {
            return Container(
              alignment: Alignment.center,
              child: Text(
                'There is no jobs for you',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }

          return ListView.builder(
            physics: BouncingScrollPhysics(),
            controller: scrollController,
            itemCount: list.length + 1,
            itemBuilder: (ctx, i) {
              if (i == list.length) {
                return Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: ColorConstants.primaryAppColor,
                    ),
                  ),
                );
              }

              return RecruitmentCard(list[i]);
            },
          );
        }),
      ),
    );
  }
}
