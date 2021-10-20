import 'package:get/get.dart';
import 'package:uni_alumni/modules/recruitment/recruitment_repository.dart';

class RecruitmentController extends GetxController {
  var selectedFilterList = [].obs;

  final RecruitmentRepository recruitmentRepository;

  RecruitmentController({required this.recruitmentRepository});
}
