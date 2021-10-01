import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/groups/group_controller.dart';
import 'package:uni_alumni/modules/groups/screens/group_screen.dart';
import 'package:uni_alumni/routes/app_pages.dart';
import 'package:uni_alumni/routes/my_keys.dart';

class GroupsList extends StatelessWidget {
  final GroupController controller = Get.put(GroupController());
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.groups.length,
      itemBuilder: (ctx, i) => GestureDetector(
        // onLongPress: () async {
        //   if (controller.groups[i].groupChild == null) return;
        //   await _buildBottomSheet(i, controller.groups[i].groupChild!, context);
        // },
        child: Container(
          width: double.infinity,
          color: Colors.white,
          margin: const EdgeInsets.only(
            top: 5.0,
            bottom: 5.0,
          ),
          child: Material(
            child: InkWell(
              splashColor: Colors.orange,
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => GroupScreen()));
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
                            controller.groups[i].imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      controller.groups[i].name,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    trailing: (controller.groups[i].groupChild != null)
                        ? IconButton(
                            icon: Icon(Icons.keyboard_arrow_right),
                            onPressed: () async {
                              if (controller.groups[i].groupChild == null)
                                return;
                              await _buildBottomSheet(
                                  i, controller.groups[i].groupChild!, context);
                            },
                          )
                        : null),
              ),
            ),
          ),
        ),
        // ),
      ),
    );
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
