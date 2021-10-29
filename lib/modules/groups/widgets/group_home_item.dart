import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/models/group.dart';
import 'package:uni_alumni/modules/groups/controllers/discover_groups_controller.dart';
import 'package:uni_alumni/modules/groups/controllers/group_child_list_controller.dart';
import 'package:uni_alumni/modules/groups/controllers/group_details_controller.dart';
import 'package:uni_alumni/modules/groups/screens/group_details_screen.dart';
import 'package:uni_alumni/shared/constants/colors.dart';
import 'package:uni_alumni/shared/widgets/error_dialog.dart';

class GroupHomeItem extends StatelessWidget {
  final Group group;
  final isGroupChildScreen;

  GroupHomeItem(this.group, {this.isGroupChildScreen = false});

  final discoverController = Get.find<DiscoverGroupsController>();
  GroupChildListController? groupChildController;

  @override
  Widget build(BuildContext context) {
    if (isGroupChildScreen) {
      groupChildController = Get.find<GroupChildListController>();
    }

    return GestureDetector(
      child: Container(
        width: double.infinity,
        color: Colors.white,
        margin: const EdgeInsets.only(
          top: 5.0,
          bottom: 5.0,
        ),
        child: Material(
          child: InkWell(
            splashColor: Colors.grey[200],
            onTap: () async {
              if (group.status == 1) {
                await Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => GroupDetailsScreen(
                    group,
                    'group-${group.id}',
                  ),
                ));

                Get.delete<GroupDetailsController>(tag: 'group-${group.id}');
              } else {
                ErrorDialog.showDialog(
                  title: 'Announcement',
                  content: 'You have not joined this group yet!',
                );
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ListTile(
                leading: Container(
                  width: 60,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Image.network(
                        group.banner!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                title: Text(
                  group.groupName!,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                trailing: _buildButton(
                    group.status!,
                    isGroupChildScreen
                        ? groupChildController
                        : discoverController),
              ),
            ),
          ),
        ),
      ),
      // ),
    );
  }

  _buildButton(int status, controller) {
    switch (status) {
      case -1:
        return TextButton.icon(
          label: Text('Request'),
          icon: Icon(Icons.add_to_home_screen),
          onPressed: () async {
            controller.toggleRequestJoinGroup(group.id!);
          },
          style: ButtonStyle(
            foregroundColor:
                MaterialStateProperty.all(ColorConstants.primaryAppColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                side: BorderSide(color: ColorConstants.primaryAppColor),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
        );
      case 0:
        return TextButton.icon(
          label: Text('Cancel'),
          icon: Icon(Icons.close),
          onPressed: () {
            controller.toggleRequestJoinGroup(group.id!, join: false);
          },
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(ColorConstants.grey),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                side: BorderSide(color: ColorConstants.grey),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
        );
      case 1:
        return IconButton(
          onPressed: null,
          icon: Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.black,
          ),
        );
    }
  }
}
