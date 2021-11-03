import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/models/group.dart';
import 'package:uni_alumni/models/recruitment.dart';
import 'package:uni_alumni/models/request/group_request.dart';
import 'package:uni_alumni/models/request/recruitment_post_request.dart';
import 'package:uni_alumni/modules/auth/auth_controller.dart';
import 'package:uni_alumni/modules/recruitment/controllers/your_jobs_controller.dart';
import 'package:uni_alumni/shared/constants/colors.dart';
import 'package:uni_alumni/shared/data/enum/recruitment_enum.dart';
import 'package:uni_alumni/shared/utils/format_utils.dart';
import 'package:uni_alumni/shared/widgets/date_time_picker_dialog.dart';

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
  Group? selectedGroup;
  DateTime? jobEndDate;
  var jobEndDateText = "".obs;
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final positionController = TextEditingController();
  final jobEndDateController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  Recruitment? currentJob = Get.arguments;

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

  @override
  void onReady() {
    super.onReady();
    if (currentJob != null) {
      titleController.text = currentJob?.title ?? '';
      descriptionController.text = currentJob?.description ?? '';
      positionController.text = currentJob?.position ?? '';
      jobEndDateController.text =
          FormatUtils.toddMMyyyy(currentJob!.endDate!.toLocal());
      phoneController.text = currentJob?.phone ?? '';
      emailController.text = currentJob?.email ?? '';
      selectedExperience.value = currentJob?.experienceLevel ?? '';
      selectedType.value = currentJob?.typeInt ?? -1;
      selectedGroup = currentJob?.group ?? null;
      if (selectedGroup!.banner == null) {
        selectedGroup!.banner = 'https://previews.123rf'
            '.com/images/andreypopov/andreypopov1403/andreypopov140301139/27041180-excited-group-of-diverse-people-holding-banner-isolated-on-white.jpg';
      }
    }
  }

  onChangeExp(Object? value) {
    selectedExperience.value = value.toString();
  }

  onChangeType(Object? value) {
    selectedType.value = int.parse(value.toString());
  }

  getGroup() async {
    GroupRequest params = GroupRequest(
      alumniId: userAuthentication!.id.toString(),
      joined: true.toString(),
    );

    List<Group>? _groups = await recruitmentRepository.getGroups(
        userAuthentication!.appToken, params);

    if (_groups != null) {
      groups.value = _groups;
    }
  }

  Future<bool?> onSubmitForm() async {
    String? email = emailController.text.isEmpty
        ? currentUser?.email
        : emailController.text;
    String? phone = phoneController.text.isEmpty
        ? currentUser?.phone
        : phoneController.text;

    RecruitmentPostRequest data = RecruitmentPostRequest(
      id: currentJob?.id ?? null,
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
      endDate: jobEndDate != null ? jobEndDate!.toUtc() : currentJob!.endDate,
      groupOriginId: selectedGroup!.id,
    );

    if (currentJob == null) {
      return _createJob(data);
    } else {
      return _updateJob(data);
    }
  }

  Future<bool?> _updateJob(RecruitmentPostRequest data) async {
    Recruitment? updatedJob = await recruitmentRepository.updateJob(
        userAuthentication!.appToken, data);
    if (updatedJob != null) {
      final yourJobsController = Get.find<YourJobsController>();
      int index = yourJobsController.myJobs
          .indexWhere((job) => job.id == updatedJob.id);
      if (index < 0) return null;
      currentJob = updatedJob;
      yourJobsController.myJobs[index] = updatedJob;
      yourJobsController.myJobs.refresh();
    } else {
      return await _showErrorDialog();
    }
  }

  Future<bool?> _createJob(RecruitmentPostRequest data) async {
    bool result = await recruitmentRepository.createRecruitment(
        userAuthentication!.appToken, data);
    if (result) {
      return await Get.defaultDialog(
        title: 'Announcement',
        content: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 5.0,
          ),
          child: Text('Your job has been created successfully.\r\n'
              'Please wait for admin to approve it'),
        ),
        confirm: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: ColorConstants.primaryAppColor,
            textStyle: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Get.back();
          },
          child: Text(
            'Close',
          ),
        ),
      );
    } else {
      return await _showErrorDialog();
    }
  }

  _showErrorDialog() async {
    return await Get.defaultDialog(
      title: 'Error!',
      content: Text('Some errors occurred'),
      cancel: TextButton(
        onPressed: () {
          Get.back(result: false);
        },
        child: Text('Cancel'),
      ),
    );
  }

  showDatePicker({DateTime? date}) async {
    DateTime? _jobEndDate =
        await DateTimePickerDialog.showDatePickerDialog(selectedDate: date);

    if (_jobEndDate != null) {
      jobEndDate = _jobEndDate;
      jobEndDateController.text = FormatUtils.toddMMyyyy(_jobEndDate);
    }
  }
}
