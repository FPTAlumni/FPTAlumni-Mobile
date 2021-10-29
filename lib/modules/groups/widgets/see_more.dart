import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/models/group.dart';
import 'package:uni_alumni/modules/groups/controllers/group_child_list_controller.dart';
import 'package:uni_alumni/modules/groups/screens/group_child_list_screen.dart';

class SeeMore extends StatelessWidget {
  final Group group;
  SeeMore(this.group, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      width: 100,
      height: 100,
      margin: const EdgeInsets.only(
        top: 10.0,
        left: 10.0,
        right: 10.0,
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.grey.withOpacity(0.7),
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            onTap: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => GroupChildListScreen(
                  group,
                ),
              ));
              Get.delete<GroupChildListController>();
            },
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'SEE\r\nMORE',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
