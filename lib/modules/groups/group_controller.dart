import 'package:get/get.dart';
import 'package:uni_alumni/models/group.dart';
import 'package:uni_alumni/modules/auth/auth_controller.dart';

import 'group_repository.dart';

class GroupTest {
  final int id;
  final String name;
  final String imageUrl;
  final int isJoin;
  List<GroupTest>? groupChild;

  GroupTest(this.id, this.name, this.imageUrl,
      {this.groupChild, this.isJoin = -1});
}

enum GroupTabs {
  yourGroup,
  discover,
}

class GroupController extends GetxController {
  var selectedFilterList = [].obs;
  final groupRepository;
  final userAuthentication = Get.find<AuthController>().userAuthentication;

  GroupController({required this.groupRepository});

  var yourGroups = [].obs;
  var discoverGroup = [].obs;

  List<GroupTest> _groups = [
    GroupTest(
      1,
      'Software Engineering very long long name',
      'https://inteng-storage.s3.amazonaws'
          '.com/img/iea/nR6bkXZxwo/sizes/software-engineering-skills_md.jpg',
      groupChild: [
        GroupTest(
          3,
          'K14',
          'https://hcmuni.fpt.edu.vn/Data/Sites/1/News/1477/2.jpg',
          isJoin: -1,
        ),
        GroupTest(
          4,
          'DSC',
          'https://image.pngaaa.com/704/2804704-middle.png',
          isJoin: -1,
        ),
      ],
      isJoin: 1,
    ),
    GroupTest(
      7,
      'FPT HCM',
      'http://zreearch.s3.amazonaws.com/projects/covers/000/001/314/big/1.jpg?1506504560',
      isJoin: 0,
    ),
    GroupTest(
      8,
      'Group Name',
      'https://inteng-storage.s3.amazonaws'
          '.com/img/iea/nR6bkXZxwo/sizes/software-engineering-skills_md.jpg',
      isJoin: -1,
    ),
    GroupTest(
      2,
      'Multi Media',
      'https://i.pinimg.com/originals/58/bd/4f/58bd4fc9ebfccc1f2de419529bbf1a12.jpg',
      groupChild: [
        GroupTest(
          5,
          'K14',
          'https://hcmuni.fpt.edu.vn/Data/Sites/1/News/1477/2.jpg',
          isJoin: -1,
        ),
        GroupTest(
          6,
          'K12',
          'https://i.chungta.vn/2019/10/10/khaigiangFU-10-1570680090_860x0.jpg',
          isJoin: -1,
        ),
      ],
      isJoin: 1,
    ),
  ];

  List<GroupTest> get tempGroups {
    return [..._groups];
  }

  int getTabIndex(GroupTabs tab) {
    switch (tab) {
      case GroupTabs.yourGroup:
        return 0;
      case GroupTabs.discover:
        return 1;
    }
  }

  Future<Group?> getGroupById(int id) async {
    return await groupRepository.getGroupById(userAuthentication!.appToken, id);
  }
}
