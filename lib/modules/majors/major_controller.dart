import 'package:get/get.dart';
import 'package:uni_alumni/models/major.dart';
import 'package:uni_alumni/modules/majors/major_repository.dart';

class MajorController extends GetxController {
  final MajorRepository majorRepository;

  MajorController({required this.majorRepository});

  var majors = [].obs;

  Future<void> getMajors(int id) async {
    List<Major>? _majors = await majorRepository.getMajors(id);
    if (_majors != null) {
      majors.value = _majors;
    }
  }
}
