
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/alumni/alumni_controller.dart';
import 'package:uni_alumni/modules/alumni/widgets/appbar_widget.dart';
import 'package:uni_alumni/modules/auth/auth_controller.dart';
import 'package:uni_alumni/shared/constants/colors.dart';
import 'package:uni_alumni/shared/widgets/upload_image_holder.dart';

class ProfileEditScreen extends GetView<AlumniController> {
  final user = Get.find<AuthController>().currentUser;
  final GlobalKey<UploadImageHolderState> _imageHolderKey = GlobalKey();
  final _formKey = GlobalKey<FormState>();
  String url =
      'https://i.pinimg.com/originals/48/a9/8a/48a98a3200a2fd9f857890aed4413357.jpg';


  @override
  Widget build(BuildContext context) {
    controller.setOldValueAlumni();
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(

        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildImage(),
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
                // _buildTextFormField(
                //     label: 'Date of birth(Optional)',
                //     hintText: 'dd/MM/yyyy',
                //     controller: controller.dobValue,
                //     onTapHandler: () {
                //       FocusScope.of(context).requestFocus(FocusNode());
                //       controller.showDatePicker(date: controller.user!.dob);
                //       // if (controller.currentJob == null) {
                //       //   controller.showDatePicker();
                //       // } else {
                //       //   controller.showDatePicker(
                //       //       date: controller.currentJob!.endDate);
                //       // }
                //     }),
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
                _buildTextFormField(
                  label: 'Job*',
                  hintText: 'Ex: Java Developer...',
                  controller: controller.jobValue,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your job.";
                    }
                    return null;
                  },
                ),

                Obx(() {
                  return _buildDropdownList(
                    label: 'Company',
                    hintText: 'Choose a company',
                    listItem: controller.dropdownCompany
                        .toList()
                        .cast<DropdownMenuItem<String>>(),
                    value: controller.selectedCompany.value.isEmpty
                        ? null
                        : controller.selectedCompany.value,
                    onChanged: (value) {
                      print("Value: " +value);
                      FocusScope.of(context).requestFocus(FocusNode());
                      controller.onChangeCompany(value);
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
                    label: 'About you(Optional)',
                    hintText: 'Some thing about yourself',
                    controller: controller.aboutMeValue,
                    textInputType: TextInputType.multiline,
                    minLines: 5,
                    textInputAction: TextInputAction.next),
                SizedBox(
                  height: 10,
                ),

                UploadImageHolder(
                  key: _imageHolderKey,
                  label: 'Image*',
                  content: 'Upload Image',
                ),


                SizedBox(
                  height: 10,
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: 320.0, minHeight: 50.0),
                  margin: EdgeInsets.all(10),
                  child: RaisedButton(
                    onPressed: () async {
                      //upload image

                      bool isValid = _formKey.currentState!.validate();
                      // FocusScope.of(context).requestFocus(FocusNode());

                      if (!isValid) {
                        return;
                      }
                      //lấy image
                      try{
                        controller.selectedImage =
                            _imageHolderKey.currentState!.getImage();
                      }on Exception {
                        controller.selectedImage = null;
                      }


                      bool? isSucceed = await controller.onSubmitAlumniForm();
                      if (isSucceed != null) {
                        Get.back();
                      }
                    },
                    splashColor: ColorConstants.white,
                    color: Color(0xffFBB97C),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Save",
                          style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
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

  Widget buildImage() {
    final image = NetworkImage(user?.image??url);//lay link tu profile
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(
            onTap: () {},
          ),
        ),
      ),
    );
  }

}






