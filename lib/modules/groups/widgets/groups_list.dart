import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/groups/widgets/group_home_item.dart';

class GroupsList extends StatelessWidget {
  var list;
  final ScrollController scrollController;
  RefreshCallback onRefresh;
  var isLoading;

  GroupsList({
    this.list,
    required this.scrollController,
    required this.onRefresh,
    this.isLoading,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RefreshIndicator(
        onRefresh: onRefresh,
        child: ListView.builder(
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          controller: scrollController,
          itemCount: list.length,
          itemBuilder: (ctx, i) => GroupHomeItem(list[i]),
        ),
      ),
    );
  }
}
