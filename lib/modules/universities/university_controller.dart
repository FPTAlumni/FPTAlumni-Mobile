import 'package:get/get.dart';
import 'package:uni_alumni/models/university.dart';
import 'package:uni_alumni/modules/universities/university_repository.dart';

class UniversityController extends GetxController {
  final UniversityRepository universityRepository;

  UniversityController({required this.universityRepository});

  var universities = [].obs;

  @override
  void onInit() {
    super.onInit();
    loadUniversities();
  }
  //
  // @override
  // onReady() async {
  //   await loadUniversities();
  // }

  Future<void> loadUniversities() async {
    List<University>? _universities =
        await universityRepository.getUniversities();
    if (_universities != null) {
      universities.value = _universities;
    }
  }
}
