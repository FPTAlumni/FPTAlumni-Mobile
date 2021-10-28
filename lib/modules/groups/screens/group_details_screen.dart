import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/groups/controllers/group_details_controller.dart';
import 'package:uni_alumni/modules/groups/group_repository.dart';
import 'package:uni_alumni/modules/groups/widgets/group_child_card.dart';
import 'package:uni_alumni/modules/groups/widgets/group_child_shimmer.dart';
import 'package:uni_alumni/modules/groups/widgets/see_more.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class GroupDetailsScreen extends StatelessWidget {
  final String groupName;
  final String banner;
  final String tag;
  GroupDetailsScreen(this.groupName, this.banner, this.tag, {Key? key})
      : super(key: key) {
    Get.put(
      GroupDetailsController(
          groupRepository: GroupRepository(apiProvider: Get.find())),
      tag: tag,
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<GroupDetailsController>(tag: tag);
    controller.groupId = ModalRoute.of(context)!.settings.arguments as int?;

    return Scaffold(
      backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leadingWidth: 30,
        title: Row(
          children: [
            SizedBox(
              width: 40,
              child: AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.network(
                    banner,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5),
            Text(
              groupName,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              maxLines: 1,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 17,
              ),
            ),
          ],
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: controller.getGroupChild,
              builder: (ctx, groupResultSnapshot) {
                return Obx(() {
                  if (controller.groupChild.length == 0) {
                    if (groupResultSnapshot.hasError) {
                      return const SizedBox();
                    }

                    if (controller.isGroupChildLoading.value) {
                      return const GroupChildShimmer();
                    } else {
                      return const SizedBox();
                    }
                  }

                  return Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.groupChild.length,
                      itemBuilder: (ctx, i) {
                        if (controller.groupChild.length > 3 &&
                            i == controller.groupChild.length - 1) {
                          return SeeMore();
                        }

                        return GroupChildCard(controller.groupChild[i]);
                      },
                    ),
                  );
                });
              }),
          Expanded(
            flex: 5,
            child: ListView(
              children: [
                Container(height: 100),
                Container(height: 100),
                Container(height: 100),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
