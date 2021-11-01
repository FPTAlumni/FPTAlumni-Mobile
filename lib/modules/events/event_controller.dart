import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uni_alumni/models/event.dart';
import 'package:uni_alumni/models/request/event_request.dart';
import 'package:uni_alumni/modules/auth/auth_controller.dart';
import 'package:uni_alumni/modules/events/event_repository.dart';
import 'package:uni_alumni/shared/constants/colors.dart';
import 'package:uni_alumni/shared/data/enum/common_enum.dart';
import 'package:uni_alumni/shared/data/enum/event_enum.dart';
import 'package:uni_alumni/shared/widgets/custom_datetime_picker.dart';

class EventController extends GetxController {
  final EventRepository eventRepository;
  final userAuthentication = Get.find<AuthController>().userAuthentication;

  EventController({required this.eventRepository});

  var events = [].obs;
  var myEvents = [].obs;
  var event = Event.empty().obs;

  final eventNameController = TextEditingController();
  final locationController = TextEditingController();
  final registrationStartController = TextEditingController();
  final registrationEndController = TextEditingController();
  final eventStartController = TextEditingController();
  final eventEndController = TextEditingController();

  final HtmlEditorController contentController = HtmlEditorController();
  final ImagePicker _picker = ImagePicker();

  String? error;

  var banner = XFile('').obs;

  EventRequest? params;

  final _pageSize = 6;
  int _page = 1;
  var isLoading = true.obs;

  @override
  onInit() {
    super.onInit();
    getEventsOfCurrentAlumni();
    getAttendedEvents();
  }

  //get all events in all groups that
  //current logged in alumni participated
  Future<void> getEventsOfCurrentAlumni() async {
    print('load events');
    EventRequest params = EventRequest(
      alumniId: userAuthentication!.id.toString(),
      status: EventStatus.registrationStart,
      sortOrder: SortOrder.DESC,
      sortKey: EventSortKey.registrationEndDate,
      page: _page.toString(),
      pageSize: _pageSize.toString(),
    );

    try {
      List<Event>? _events =
          await eventRepository.getEvents(userAuthentication!.appToken, params);
      if (_events != null) {
        error = null;
        events.addAll(_events);
        _page++;
        isLoading.value = true;
        if (_events.length < _pageSize) {
          isLoading.value = false;
        }
      }
    } on Exception {
      error = 'There is no Event';
    }
  }

  Future<void> getAttendedEvents() async {
    EventRequest params = EventRequest(
      alumniId: userAuthentication!.id.toString(),
      sortOrder: SortOrder.DESC,
      sortKey: EventSortKey.registrationEndDate,
      pageSize: "100",
    );

    List<Event>? _events =
        await eventRepository.getEvents(userAuthentication!.appToken, params);

    if (_events != null) {
      myEvents.value = _events.where((event) => event.inEvent == true).toList();
    }
  }

  Future<void> refreshUpcoming() async {
    isLoading.value = false;
    events.value = [];
    _page = 1;
    error = null;
    await getEventsOfCurrentAlumni();
  }

  Future<void> refreshYourEvents() async {
    await getAttendedEvents();
  }

  joinEvent(int eventId) async {
    bool result =
        await eventRepository.joinEvent(userAuthentication!.appToken, eventId);

    if (result == true) {
      int index = events.indexWhere((e) {
        return (e as Event).id == eventId;
      });

      if (index < 0) return;

      (events.elementAt(index) as Event).joinEvent();
      myEvents.insert(0, events.elementAt(index));

      events.refresh();
      myEvents.refresh();
    }
  }

  leaveEvent(int eventId) async {
    bool result =
        await eventRepository.leaveEvent(userAuthentication!.appToken, eventId);

    if (result == true) {
      int index = events.indexWhere((e) {
        return (e as Event).id == eventId;
      });

      if (index < 0) return;

      (events.elementAt(index) as Event).leaveEvent();
      myEvents.removeWhere((e) => (e as Event).id == eventId);

      events.refresh();
      myEvents.refresh();
    }
  }

  // void showImageDialog() async {
  //   XFile? _banner = await _picker.pickImage(source: ImageSource.gallery);
  //   if (_banner == null) return;
  //   banner.value = _banner;
  // }
  //
  // bool isContainedImage() => banner.value.path.isNotEmpty;

  void showDatePicker() {
    DatePicker.showPicker(Get.context!,
        showTitleActions: true,
        theme: DatePickerTheme(
          doneStyle: TextStyle(
            color: ColorConstants.primaryAppColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ), onChanged: (date) {
      print('change $date in time zone ' +
          date.timeZoneOffset.inHours.toString());
    }, onConfirm: (date) {
      print('confirm $date');
    },
        pickerModel: CustomDateTimePicker(
          currentTime: DateTime.now(),
          minTime: DateTime.now(),
        ),
        locale: LocaleType.en);
  }
}
