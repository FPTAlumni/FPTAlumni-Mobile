import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/models/group.dart';
import 'package:uni_alumni/models/response/alumni_group_response.dart';
import 'package:uni_alumni/modules/groups/controllers/group_controller.dart';
import 'package:uni_alumni/modules/groups/controllers/group_details_controller.dart';
import 'package:uni_alumni/modules/groups/screens/group_details_screen.dart';
import 'package:uni_alumni/shared/widgets/confirm_dialog.dart';
import 'package:uni_alumni/shared/widgets/error_dialog.dart';

class GroupChildCard extends StatelessWidget {
  final tag;

  Group group;

  GroupChildCard(this.group, this.tag);

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
          AlumniGroupResponse? alumni =
              await groupController.isInGroup(group.id!);

          //not join group
          if (alumni == null) {
            bool? isConfirm = await ConfirmDialog.showDialog(
                title: 'Announcement',
                msg: 'You have not joined in this group yet!\r\n'
                    'Do you want to request to join?');
            if (isConfirm != null) {
              final groupDetailsController =
                  Get.find<GroupDetailsController>(tag: tag);
              groupDetailsController.toggleRequestJoinGroup(group.id!);
            }
            return;
          }

          //request is pending
          if (alumni.status == Group.pending) {
            bool? isConfirm = await ConfirmDialog.showDialog(
                title: 'Announcement',
                msg: 'Do you want to cancel the request to join this group?');
            if (isConfirm != null) {
              final groupDetailsController =
                  Get.find<GroupDetailsController>(tag: tag);
              groupDetailsController.toggleRequestJoinGroup(group.id!,
                  join: false);
            }
            return;
          }

          //banned
          if (alumni.status == Group.banned) {
            ErrorDialog.showDialog(
              title: 'Announcement',
              content: 'You have been banned from this group!',
            );
            return;
          }

          await Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => GroupDetailsScreen(group, 'group-${group.id}'),
          ));
          Get.delete<GroupDetailsController>(tag: 'group-${group.id}');
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
