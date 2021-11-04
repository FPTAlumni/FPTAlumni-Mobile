

import 'package:get/get.dart';
import 'package:uni_alumni/modules/alumni/alumni_repository.dart';
import 'package:uni_alumni/modules/company/company_repository.dart';

import 'alumni_controller.dart';

class AlumniBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AlumniController(alumniRepository: AlumniRepository(apiProvider: Get.find()),
                                        companyRepository: CompanyRepository(apiProvider: Get.find()),));
  }

}