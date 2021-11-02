import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/models/event.dart';
import 'package:uni_alumni/models/news.dart';
import 'package:uni_alumni/models/recruitment.dart';
import 'package:uni_alumni/modules/events/widgets/event_card.dart';
import 'package:uni_alumni/modules/groups/controllers/group_details_controller.dart';
import 'package:uni_alumni/modules/news/widgets/news_card.dart';
import 'package:uni_alumni/modules/recruitment/widgets/recruitment_card.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class GroupPostsList extends StatelessWidget {
  final String tag;
  GroupPostsList({required this.tag, Key? key}) : super(key: key);

  GroupDetailsController get controller {
    return Get.find<GroupDetailsController>(tag: tag);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: controller.refresh,
      child: Obx(
        () => ListView.builder(
          controller: controller.scrollController,
          itemCount: controller.isLoading.value
              ? controller.posts.length + 1
              : controller.posts.length,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          itemBuilder: (context, i) {
            if (i == controller.posts.length) {
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

            if (controller.posts[i] is News) {
              return NewsCard(controller.posts[i]);
            } else if (controller.posts[i] is Recruitment) {
              return RecruitmentCard(job: controller.posts[i]);
            } else {
              return EventCard(controller.posts[i] as Event);
            }
          },
        ),
      ),
    );
  }
}
