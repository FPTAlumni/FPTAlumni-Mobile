import 'package:flutter/material.dart';
import 'package:uni_alumni/modules/groups/widgets/group_child_card.dart';
import 'package:uni_alumni/shared/widgets/sub_screen_app_bar.dart';

class GroupDetailsScreen extends StatelessWidget {
  const GroupDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SubScreenAppBar(
        title: 'Group name',
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GroupChildCard(),
                GroupChildCard(),
                GroupChildCard(),
                GroupChildCard(),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: ListView(
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
