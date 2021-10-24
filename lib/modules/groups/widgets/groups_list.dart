import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/groups/group_controller.dart';
import 'package:uni_alumni/modules/groups/screens/group_details_screen.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class GroupsList extends StatelessWidget {
  final GroupController controller = Get.find<GroupController>();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.tempGroups.length,
      itemBuilder: (ctx, i) => GestureDetector(
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
              onTap: () {
                Get.to(() => GroupDetailsScreen());
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
                          controller.tempGroups[i].imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    controller.tempGroups[i].name,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  trailing: _buildButton(controller.tempGroups[i].isJoin),
                ),
              ),
            ),
          ),
        ),
        // ),
      ),
    );
  }

  _buildButton(int status) {
    switch (status) {
      case -1:
        return TextButton.icon(
          label: Text('Request'),
          icon: Icon(Icons.add_to_home_screen),
          onPressed: () async {
            // if (controller.groups[i].groupChild == null)
            //   return;
            // await _buildBottomSheet(
            //     i, controller.groups[i].groupChild!, context);
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
          label: Text('Requested'),
          icon: Icon(Icons.add_to_home_screen),
          onPressed: null,
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
            ));
      // return TextButton.icon(
      //   label: Text('Joined'),
      //   icon: Icon(Icons.check),
      //   onPressed: null,
      //   style: ButtonStyle(
      //     foregroundColor: MaterialStateProperty.all(Colors.green[700]),
      //     shape: MaterialStateProperty.all(
      //       RoundedRectangleBorder(
      //         side: BorderSide(color: Colors.green[700]!),
      //         borderRadius: BorderRadius.all(Radius.circular(10.0)),
      //       ),
      //     ),
      //   ),
      // );
    }
  }
}
