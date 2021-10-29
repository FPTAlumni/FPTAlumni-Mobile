import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/recruitment/widgets/my_job_card.dart';
import 'package:uni_alumni/modules/recruitment/widgets/recruitment_card.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class RecruitmentList extends StatelessWidget {
  var list;
  final ScrollController scrollController;
  RefreshCallback onRefresh;
  var isLoading;
  bool isMyJobs;

  RecruitmentList({
    required this.list,
    required this.scrollController,
    required this.onRefresh,
    this.isLoading,
    this.isMyJobs = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RefreshIndicator(
        onRefresh: onRefresh,
        child: Obx(() {
          if (list.length == 0 && !isLoading.value) {
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    alignment: Alignment.center,
                    child: Text(
                      'There is no job for you',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            controller: scrollController,
            itemCount: isLoading.value ? list.length + 1 : list.length,
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

              return isMyJobs
                  ? MyJobCard(list[i], key: ValueKey(list[i].id))
                  : RecruitmentCard(job: list[i], key: ValueKey(list[i].id));
            },
          );
        }),
      ),
    );
  }
}
