import 'package:get/get.dart';
import 'package:uni_alumni/models/clazz.dart';
import 'package:uni_alumni/modules/clazz/clazz_repository.dart';

class ClazzController extends GetxController {
  final ClazzRepository clazzRepository;

  ClazzController({required this.clazzRepository});

  var clazzList = [].obs;

  @override
  onInit() {
    super.onInit();
    // loadClasses();
  }

  Future<void> loadClasses() async {
    List<Clazz>? _clazzList = await clazzRepository.getClasses();
    if (_clazzList != null) {
      clazzList.value = _clazzList;
    }
  }
}
