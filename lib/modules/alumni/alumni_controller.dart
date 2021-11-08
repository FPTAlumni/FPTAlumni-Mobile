import 'package:get/get.dart';
import 'package:uni_alumni/modules/alumni/alumni_repository.dart';
import 'package:uni_alumni/modules/auth/auth_controller.dart';
import 'package:uni_alumni/modules/company/company_repository.dart';

class AlumniController extends GetxController {
  final AlumniRepository alumniRepository;
  final CompanyRepository companyRepository;

  final user = Get.find<AuthController>().currentUser.obs;

  AlumniController(
      {required this.alumniRepository, required this.companyRepository});

  @override
  void onInit() {
    super.onInit();
  }
}
