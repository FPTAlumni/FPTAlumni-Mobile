import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/groups/group_controller.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class GroupsList extends StatelessWidget {
  final GroupController controller = Get.put(GroupController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List<Group> list = [];
      if (controller.selectedTab.value ==
          controller.getTabIndex(GroupTabs.yourGroup)) {
        list = controller.groups.where((group) => group.isJoin == 1).toList();
      } else {
        list = controller.groups
            .where((group) => group.isJoin == 0 || group.isJoin == -1)
            .toList();
      }
      return _buildList(list);
    });
  }

  Widget _buildList(List<Group> list) {
    return ListView.builder(
      itemCount: list.length,
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
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (ctx) => GroupHome()));
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
                          list[i].imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    list[i].name,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  trailing: _buildButton(list[i].isJoin),
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

  _buildBottomSheet(
      int parentIndex, List<Group> groupChild, BuildContext context) {
    showModalBottomSheet(
      context: context,
      enableDrag: true,
      isScrollControlled: true,
      builder: (_) {
        return Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height / 2,
          ),
          child: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  '${controller.groups[parentIndex].name}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              ...groupChild
                  .map(
                    (group) => Container(
                      width: double.infinity,
                      color: Colors.white,
                      margin: const EdgeInsets.only(
                        bottom: 5.0,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: ListTile(
                        leading: Container(
                          width: 60,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              child: Image.network(
                                group.imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        title: Text(
                          group.name,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ]),
          ),
        );
      },
    );
  }
}
