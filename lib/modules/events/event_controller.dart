import 'package:flutter/cupertino.dart';
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
import 'package:uni_alumni/shared/widgets/custom_datetime_picker.dart';

class EventController extends GetxController {
  final EventRepository eventRepository;
  final userAuthentication = Get.find<AuthController>().userAuthentication;

  EventController({required this.eventRepository});

  List<Event> events = [];

  final eventNameController = TextEditingController();
  final locationController = TextEditingController();
  final registrationStartController = TextEditingController();
  final registrationEndController = TextEditingController();
  final eventStartController = TextEditingController();
  final eventEndController = TextEditingController();

  final HtmlEditorController contentController = HtmlEditorController();
  final ImagePicker _picker = ImagePicker();

  var banner = XFile('').obs;

  @override
  onInit() {
    super.onInit();
    getEventsOfCurrentAlumni();
  }

  //get all events in all groups that
  //current logged in alumni participated
  getEventsOfCurrentAlumni() async {
    EventRequest params = EventRequest(
      alumniId: userAuthentication!.id.toString(),
      sortOrder: SortOrder.DESC,
    );

    List<Event>? _events =
        await eventRepository.getEvents(userAuthentication!.appToken, params);
    if (_events != null) {
      events = _events;
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
