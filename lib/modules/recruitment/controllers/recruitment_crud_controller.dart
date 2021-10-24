import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/models/request/group_request.dart';
import 'package:uni_alumni/models/request/recruitment_post_request.dart';
import 'package:uni_alumni/models/response/recruitment_group_response.dart';
import 'package:uni_alumni/modules/auth/auth_controller.dart';
import 'package:uni_alumni/shared/constants/colors.dart';
import 'package:uni_alumni/shared/data/enum/recruitment_enum.dart';
import 'package:uni_alumni/shared/utils/format_utils.dart';
import 'package:uni_alumni/shared/widgets/custom_datetime_picker.dart';

import '../recruitment_repository.dart';

class RecruitmentCrudController extends GetxController {
  final RecruitmentRepository recruitmentRepository;

  RecruitmentCrudController({required this.recruitmentRepository});

  final userAuthentication = Get.find<AuthController>().userAuthentication;
  final currentUser = Get.find<AuthController>().currentUser;

  var dropdownExperience = [];
  var dropdownType = [];
  var selectedExperience = "".obs;
  var selectedType = (-1).obs;

  var groups = [].obs;
  RecruitmentGroupResponse? selectedGroup;
  DateTime? jobEndDate = DateTime.now();
  var jobEndDateText = "".obs;
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final positionController = TextEditingController();
  final jobEndDateController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    //load dropdownExperience
    print('load exp');
    for (String exp in RecruitmentEnum.experienceMap.values) {
      dropdownExperience.add(DropdownMenuItem(
        child: Text(exp),
        value: exp,
      ));
    }

    //load dropdownType
    print('load type');
    for (var entry in RecruitmentEnum.typeMap.entries) {
      dropdownType.add(DropdownMenuItem(
        child: Text(entry.value),
        value: RecruitmentEnum.getTypeIndex(entry.key),
      ));
    }

    getGroup();
  }

  onChangeExp(Object? value) {
    selectedExperience.value = value.toString();
  }

  onChangeType(Object? value) {
    selectedType.value = int.parse(value.toString());
  }

  getGroup() async {
    GroupRequest params =
        GroupRequest(alumniId: userAuthentication!.id.toString());

    List<RecruitmentGroupResponse>? _groups = await recruitmentRepository
        .getGroups(userAuthentication!.appToken, params);

    if (_groups != null) {
      groups.value = _groups;
    }
  }

  Future<String> onSubmitForm() async {
    String? email = emailController.text.isEmpty
        ? currentUser?.email
        : emailController.text;
    String? phone = phoneController.text.isEmpty
        ? currentUser?.phone
        : phoneController.text;

    RecruitmentPostRequest data = RecruitmentPostRequest(
      title: titleController.text,
      description: descriptionController.text,
      position: positionController.text,
      experience: selectedExperience.value,
      phone: phone,
      email: email,
      alumniId: currentUser!.id,
      groupId: selectedGroup!.id,
      companyId: currentUser!.company!.id,
      type: selectedType.value,
      endDate: jobEndDate!.toUtc(),
      groupOriginId: selectedGroup!.id,
    );

    bool result = await recruitmentRepository.createRecruitment(
        userAuthentication!.appToken, data);
    if (result) {
      return 'Your job has been created successfully.\r\n'
          'Please wait for admin to approve it';
    }
    return 'Error occurred';
  }

  showDatePicker() async {
    DateTime? _jobEndDate = await DatePicker.showPicker(Get.context!,
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
    },
        pickerModel: CustomDateTimePicker(
          currentTime: DateTime.now(),
          minTime: DateTime.now(),
        ),
        locale: LocaleType.en);

    if (_jobEndDate != null) {
      jobEndDate = _jobEndDate;
      jobEndDateController.text = FormatUtils.toddMMyyyyHHmm(_jobEndDate);
    }
  }
}
