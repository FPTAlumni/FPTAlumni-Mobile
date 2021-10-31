import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/models/group.dart';
import 'package:uni_alumni/modules/recruitment/controllers/recruitment_crud_controller.dart';
import 'package:uni_alumni/shared/constants/colors.dart';
import 'package:uni_alumni/shared/widgets/sub_screen_app_bar.dart';

class RecruitmentCrud extends GetView<RecruitmentCrudController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
      appBar: SubScreenAppBar(
        title: controller.currentJob == null
            ? 'Create your job'
            : 'Update your job',
      ),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Container(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildHeader('Job information'),
                  _buildTextFormField(
                      label: 'Title*',
                      hintText: 'Enter job title',
                      controller: controller.titleController,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter job title";
                        }
                        if (value.length > 100) {
                          return "Title only contain 100 characters";
                        }
                        return null;
                      }),
                  _buildTextFormField(
                      label: 'Description*',
                      hintText: 'Enter job description',
                      controller: controller.descriptionController,
                      textInputType: TextInputType.multiline,
                      minLines: 5,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter job description";
                        }
                        return null;
                      }),
                  _buildTextFormField(
                      label: 'Position*',
                      hintText: 'Enter job position',
                      controller: controller.positionController,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter job position";
                        }
                        if (value.length > 70) {
                          return "Position only contain 70 characters";
                        }
                        return null;
                      }),
                  Obx(() {
                    return _buildDropdownList(
                      label: 'Job Experience*',
                      hintText: 'Choose job experience',
                      listItem: controller.dropdownExperience
                          .toList()
                          .cast<DropdownMenuItem<String>>(),
                      value: controller.selectedExperience.value.isEmpty
                          ? null
                          : controller.selectedExperience.value,
                      onChanged: (value) {
                        FocusScope.of(context).requestFocus(FocusNode());
                        controller.onChangeExp(value);
                      },
                      validator: (value) {
                        if (value == null) {
                          return "Please choose job experience";
                        }
                        return null;
                      },
                    );
                  }),
                  Obx(() {
                    return _buildDropdownList(
                      label: 'Job Type*',
                      hintText: 'Choose job type',
                      listItem: controller.dropdownType
                          .toList()
                          .cast<DropdownMenuItem<int>>(),
                      value: controller.selectedType.value < 0
                          ? null
                          : controller.selectedType.value,
                      onChanged: (value) {
                        FocusScope.of(context).requestFocus(FocusNode());
                        controller.onChangeType(value);
                      },
                      validator: (value) {
                        if (value == null) {
                          return "Please choose job type";
                        }
                        return null;
                      },
                    );
                  }),
                  _buildTextFormField(
                      label: 'Job End Date*',
                      hintText: 'dd/MM/yyyy',
                      controller: controller.jobEndDateController,
                      readOnly: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please choose date the job ends";
                        }
                        return null;
                      },
                      onTapHandler: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        if (controller.currentJob == null) {
                          controller.showDatePicker();
                        } else {
                          controller.showDatePicker(
                              date: controller.currentJob!.endDate);
                        }
                      }),
                  Obx(() => _buildGroupDropdown()),
                  _buildHeader(
                    'Recruiter Information\r\n',
                    note: '(If you do not fill these fields, '
                        'we will use information in your profile)',
                  ),
                  _buildTextFormField(
                    label: 'Phone',
                    hintText: 'Enter your phone',
                    controller: controller.phoneController,
                    textInputType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                  ),
                  _buildTextFormField(
                    label: 'Email',
                    hintText: 'Enter your email',
                    controller: controller.emailController,
                    textInputAction: TextInputAction.done,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 20.0,
                      left: 30.0,
                      right: 30.0,
                      bottom: 10.0,
                    ),
                    child: ElevatedButton(
                      onPressed: () async {
                        FocusScopeNode currentFocus = FocusScope.of(context);

                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }

                        bool isValid = _formKey.currentState!.validate();
                        if (!isValid) return;
                        bool? isError = await controller.onSubmitForm();
                        if (isError != null) {
                          return;
                        }
                        Get.back(result: controller.currentJob);
                      },
                      child: Text(
                          controller.currentJob == null ? 'Create' : 'Update'),
                      style: ElevatedButton.styleFrom(
                        elevation: 2.0,
                        primary: ColorConstants.primaryAppColor,
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(String label, {String note = ''}) {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(
        top: 20.0,
        left: 30.0,
        right: 30.0,
      ),
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: ColorConstants.primaryAppColor,
          ),
          children: [
            TextSpan(text: label),
            TextSpan(
              text: note,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.normal,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGroupDropdown() {
    return Container(
      margin: const EdgeInsets.only(
        top: 20.0,
        left: 30.0,
        right: 30.0,
      ),
      child: DropdownSearch<Group>(
        mode: Mode.BOTTOM_SHEET,
        label: 'Group*',
        dropdownSearchDecoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
        selectedItem: controller.selectedGroup,
        compareFn: (i, s) => i?.isEqual(s) ?? false,
        showSelectedItems: true,
        popupTitle: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 10.0,
          ),
          alignment: Alignment.topCenter,
          child: Text(
            'Groups',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        showSearchBox: true,
        dropdownBuilder: _customDropdownBuilder,
        popupItemBuilder: _customPopupItemBuilder,
        onChanged: (selectedGroup) {
          controller.selectedGroup = selectedGroup;
        },
        items: controller.groups.toList().cast<Group>(),
        popupSafeArea: PopupSafeArea(top: true, bottom: true),
        scrollbarProps: ScrollbarProps(
          isAlwaysShown: true,
          thickness: 7,
        ),
        validator: (value) {
          if (value == null) {
            return "Please choose a group";
          }
          return null;
        },
      ),
    );
  }

  Widget _customDropdownBuilder(BuildContext context, Group? group) {
    if (group == null) {
      return Text(
        'Choose a group',
        style: TextStyle(fontSize: 16),
      );
    }

    return _buildGroup(group.banner, group.groupName);
  }

  Widget _customPopupItemBuilder(
      BuildContext context, Group? group, bool isSelected) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              border: Border.all(color: ColorConstants.primaryAppColor),
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
      child: _buildGroup(group?.banner, group?.groupName),
    );
  }

  Widget _buildGroup(String? banner, String? name) {
    return Container(
      margin: const EdgeInsets.only(
        top: 8.0,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(banner ?? ''),
          backgroundColor: Colors.transparent,
        ),
        title: Text(name ?? ''),
      ),
    );
  }

  Widget _buildDropdownList({
    required String label,
    required String hintText,
    FormFieldValidator<Object>? validator,
    ValueChanged<dynamic>? onChanged,
    var listItem,
    var value,
  }) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20.0,
        left: 30.0,
        right: 30.0,
      ),
      child: DropdownButtonFormField(
        items: listItem,
        value: value,
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
          label: Text(label),
          hintText: hintText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required String label,
    int? maxLines,
    int? minLines,
    String? hintText,
    bool readOnly = false,
    VoidCallback? onTapHandler,
    TextInputType textInputType = TextInputType.text,
    TextEditingController? controller,
    FormFieldValidator<String>? validator,
    TextInputAction? textInputAction,
  }) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20.0,
        left: 30.0,
        right: 30.0,
      ),
      child: TextFormField(
        controller: controller,
        validator: validator,
        maxLines: maxLines,
        minLines: minLines,
        keyboardType: textInputType,
        onTap: onTapHandler,
        readOnly: readOnly,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          label: Text(label),
          hintText: hintText,
          // floatingLabelStyle: TextStyle(color: ColorConstants.primaryAppColor),
          // labelStyle: TextStyle(color: Colors.black),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
