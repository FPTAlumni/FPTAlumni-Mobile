import 'package:get/get.dart';
import 'package:uni_alumni/models/event.dart';
import 'package:uni_alumni/modules/auth/auth_controller.dart';
import 'package:uni_alumni/modules/events/event_repository.dart';

class EventController extends GetxController {
  final EventRepository eventRepository;
  final userAuthentication = Get.find<AuthController>().userAuthentication;

  EventController({required this.eventRepository});

  List<Event> events = [];

  @override
  onInit() {
    super.onInit();
    getEvents();
  }

  getEvents() async {
    List<Event>? _events =
        await eventRepository.getEvents(userAuthentication!.appToken);
    if (_events != null) {
      events = _events;
    }
  }
}
