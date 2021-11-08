import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/models/event.dart';
import 'package:uni_alumni/models/news.dart';
import 'package:uni_alumni/models/recruitment.dart';
import 'package:uni_alumni/modules/events/widgets/event_card.dart';
import 'package:uni_alumni/modules/home/controllers/home_controller.dart';
import 'package:uni_alumni/modules/news/widgets/news_card.dart';
import 'package:uni_alumni/modules/recruitment/widgets/recruitment_card.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class HomePostsList extends StatelessWidget {
  HomePostsList({Key? key}) : super(key: key);

  HomeController _controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _controller.refresh,
      child: Obx(() {
        if (_controller.posts.length == 0) {
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
                    'There is no posts for you',
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
          controller: _controller.scrollController,
          itemCount: _controller.isLoading.value
              ? _controller.posts.length + 1
              : _controller.posts.length,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          itemBuilder: (context, i) {
            if (i == _controller.posts.length) {
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

            if (_controller.posts[i] is News) {
              return NewsCard(_controller.posts[i]);
            } else if (_controller.posts[i] is Recruitment) {
              return RecruitmentCard(job: _controller.posts[i]);
            } else {
              return EventCard(_controller.posts[i] as Event,
                  list: _controller.posts);
            }
          },
        );
      }),
    );
  }
}
