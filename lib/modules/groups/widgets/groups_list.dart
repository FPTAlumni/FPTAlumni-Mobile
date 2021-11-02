import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/groups/widgets/group_home_item.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class GroupsList extends StatelessWidget {
  var list;
  final ScrollController scrollController;
  RefreshCallback onRefresh;
  var isLoading;
  bool isGroupChild;

  GroupsList({
    this.list,
    required this.scrollController,
    required this.onRefresh,
    this.isLoading,
    this.isGroupChild = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: Obx(() {
        if (list.length == 0) {
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
                    'There is no group for you',
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
            return GroupHomeItem(
              list[i],
              isGroupChildScreen: isGroupChild,
            );
          },
        );
      }),
    );
  }
}
