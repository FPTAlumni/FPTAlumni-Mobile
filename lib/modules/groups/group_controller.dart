import 'package:get/get.dart';

class Group {
  final int id;
  final String name;
  final String imageUrl;
  List<Group>? groupChild;

  Group(this.id, this.name, this.imageUrl, {this.groupChild});
}

class GroupController extends GetxController {
  var selectedFilterList = [].obs;
  List<Group> _groups = [
    Group(
      1,
      'Software Engineering very long long name',
      'https://inteng-storage.s3.amazonaws'
          '.com/img/iea/nR6bkXZxwo/sizes/software-engineering-skills_md.jpg',
      groupChild: [
        Group(
          3,
          'K14',
          'https://hcmuni.fpt.edu.vn/Data/Sites/1/News/1477/2.jpg',
        ),
        Group(
          4,
          'DSC',
          'https://image.pngaaa.com/704/2804704-middle.png',
        ),
      ],
    ),
    Group(
      7,
      'FPT HCM',
      'http://zreearch.s3.amazonaws.com/projects/covers/000/001/314/big/1.jpg?1506504560',
    ),
    Group(
      8,
      'Group Name',
      'https://inteng-storage.s3.amazonaws'
          '.com/img/iea/nR6bkXZxwo/sizes/software-engineering-skills_md.jpg',
    ),
    Group(
      2,
      'Multi Media',
      'https://i.pinimg.com/originals/58/bd/4f/58bd4fc9ebfccc1f2de419529bbf1a12.jpg',
      groupChild: [
        Group(
          5,
          'K14',
          'https://hcmuni.fpt.edu.vn/Data/Sites/1/News/1477/2.jpg',
        ),
        Group(
          6,
          'K12',
          'https://i.chungta.vn/2019/10/10/khaigiangFU-10-1570680090_860x0.jpg',
        ),
      ],
    ),
  ];

  List<Group> get groups {
    return [..._groups];
  }
}
