import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/models/group.dart';
import 'package:uni_alumni/modules/groups/controllers/group_controller.dart';
import 'package:uni_alumni/modules/groups/controllers/group_details_controller.dart';
import 'package:uni_alumni/modules/groups/screens/group_details_screen.dart';
import 'package:uni_alumni/shared/widgets/error_dialog.dart';

class GroupChildCard extends StatelessWidget {
  final imgUrl = 'https://encrypted-tbn0.gstatic'
      '.com/images?q=tbn:ANd9GcTUav0-r_Oe3WxyBiWOptWotLxuwpfq4rUwg_v8kC5rLbtGiKiAELp-oAF6PY5eT3DB_SI&usqp=CAU';

  Group group;

  GroupChildCard(this.group);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      margin: const EdgeInsets.only(
        top: 10.0,
        left: 10.0,
      ),
      child: GestureDetector(
        onTap: () async {
          //check if this Alumni in group
          final groupController = Get.find<GroupController>();
          bool result = await groupController.isInGroup(group.id!);

          if (result) {
            await Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => GroupDetailsScreen(group, 'group-${group.id}'),
            ));
            Get.delete<GroupDetailsController>(tag: 'group-${group.id}');
          } else {
            ErrorDialog.showDialog(
                content: 'You were banned or you were not in this group');
          }
        },
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(group.banner!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Colors.black38,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 5.0,
                vertical: 8.0,
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  group.groupName ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
