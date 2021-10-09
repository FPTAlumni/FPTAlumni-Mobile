import 'dart:io';

import 'package:get/get.dart';
import 'package:uni_alumni/models/event.dart';
import 'package:uni_alumni/models/request/event_request.dart';
import 'package:uni_alumni/modules/auth/auth_controller.dart';
import 'package:uni_alumni/modules/events/event_repository.dart';
import 'package:uni_alumni/shared/data/event_enum.dart';

class EventController extends GetxController {
  final EventRepository eventRepository;
  final userAuthentication = Get.find<AuthController>().userAuthentication;

  EventController({required this.eventRepository});

  List<Event> events = [];

  @override
  onInit() {
    super.onInit();
    getEventsOfCurrentAlumni();
  }

  //get all events in all groups that
  //current logged in alumni participated
  getEventsOfCurrentAlumni() async {
    EventRequest params = EventRequest(
      alumniId: userAuthentication!.id,
      sortOrder: SortOrder.DESC,
    );

    List<Event>? _events =
        await eventRepository.getEvents(userAuthentication!.appToken, params);
    if (_events != null) {
      events = _events;
    }
  }
}
