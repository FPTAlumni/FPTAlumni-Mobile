
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/shared/constants/colors.dart';
import 'package:uni_alumni/shared/widgets/sub_screen_app_bar.dart';

import '../referral_controller.dart';

class ReferralRegistration extends GetView<ReferralController> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
      appBar: SubScreenAppBar(title: 'New referral'),
      body: Container(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildHeader('Referral information'),
                _buildTextFormField(
                    label: 'Full Name*',
                    hintText: 'Ex: Nguyen Phan Quynh Anh',
                    controller: controller.fullNameValue,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter fullname ";
                      }
                      return null;
                    }),
                _buildTextFormField(
                    label: 'Phone*',
                    hintText: 'Enter phone number',
                    controller: controller.phoneValue,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter phone number";
                      }
                      return null;
                    }),
                _buildTextFormField(
                    label: 'Address*',
                    hintText: 'Ex: 144 Duong Dinh Hoi, Ho Chi Minh.',
                    controller: controller.addressValue,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your address.";
                      }
                      return null;
                    },
                    ),
                Obx(() {
                  return _buildDropdownList(
                    label: 'Relationship*',
                    hintText: 'Choose the relationship with your referral.',
                    listItem: controller.dropdownVoucher
                        .toList()
                        .cast<DropdownMenuItem<String>>(),
                    value: controller.selectedVoucher.value.isEmpty
                        ? null
                        : controller.selectedVoucher.value,
                    onChanged: (value) {
                      print("Value: " +value);
                      FocusScope.of(context).requestFocus(FocusNode());
                      controller.onChangeVoucher(value);
                    },
                    validator: (value) {
                      if (value == null) {
                        return "Please choose the relationship.";
                      }
                      return null;
                    },
                  );
                }),
                _buildTextFormField(
                  label: 'School (Optional)',
                  hintText: 'Ex: Nguyen Cong Tru High School...',
                  controller: controller.highSchoolNameValue,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your address.";
                    }
                    return null;
                  },
                ),

                _buildHeader(
                  'More Information\r\n',
                  note: '(Optional: This is referral\'s parent or the referral\'s relatives )',
                ),
                _buildTextFormField(
                  label: 'Full Name',
                  hintText: 'Enter full name',
                  controller: controller.parentNameValue,
                  textInputType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                ),
                _buildTextFormField(
                  label: 'Phone',
                  hintText: 'Enter phone number',
                  controller: controller.parentPhoneValue,
                  textInputType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
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
                      bool isValid = _formKey.currentState!.validate();
                      if (!isValid) return;
                      bool? isError = await controller.onSubmitReferralForm();
                      if (isError != null) {
                        return;
                      }
                      Get.back();
                    },
                    child: Text(
                        // controller.currentJob == null ? 'Create' : 'Update'),
                        'Create'),
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
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(10))
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
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
        ),
      ),
    );
  }

}
