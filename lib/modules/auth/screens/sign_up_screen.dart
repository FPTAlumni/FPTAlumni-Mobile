import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uni_alumni/modules/auth/auth_controller.dart';
import 'package:uni_alumni/modules/auth/widgets/background.dart';
import 'package:uni_alumni/shared/constants/assets.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class SignUpScreen extends GetView<AuthController> {
  final GlobalKey<FormState> signUpKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Background(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 5.0),
                        width: 90,
                        child: AspectRatio(
                          aspectRatio: 1 / 1,
                          child: Image.asset(
                            AssetConstants.logo,
                          ),
                        ),
                      ),
                      Text(
                        'Registration',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorConstants.primaryAppColor,
                          fontSize: 30,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
                Form(
                  key: signUpKey,
                  child: Column(
                    children: [
                      _buildTextFormField(
                        labelText: 'Full name',
                        controller: controller.fullNameController,
                        maxLength: 70,
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "Please enter your full name";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: size.height * 0.01),
                      _buildTextFormField(
                        labelText: 'Phone number',
                        controller: controller.phoneController,
                        maxLength: 15,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "Please enter your phone number";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: size.height * 0.01),
                      _buildTextFormField(
                        labelText: 'Date of birth',
                        controller: controller.dobController,
                        readOnly: true,
                        hint: 'dd/MM/yyyy',
                        onTapHandler: () async {
                          FocusScope.of(context).requestFocus(FocusNode());
                          await pickDate(context);
                        },
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "Please enter your date of birth";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: size.height * 0.01),
                      _buildDropDown(
                        hint: 'Choose your university',
                        value: controller.selectedUniversity.value == 0
                            ? null
                            : controller.selectedUniversity.value,
                        items: controller.dropdownUniversities.toList().cast(),
                        onChanged: (value) {
                          FocusScope.of(context).requestFocus(FocusNode());
                          controller
                              .onChangeUniversity(int.parse(value.toString()));
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Please choose your university';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: size.height * 0.01),
                      Obx(() {
                        return _buildDropDown(
                          hint: 'Choose your class',
                          value: controller.selectedClass.value == 0
                              ? null
                              : controller.selectedClass.value,
                          items: controller.dropdownClasses.toList().cast(),
                          onChanged: (value) {
                            FocusScope.of(context).requestFocus(FocusNode());
                            controller
                                .onChangeClass(int.parse(value.toString()));
                          },
                          validator: (value) {
                            if (value == null) {
                              return 'Please choose your class';
                            }
                            return null;
                          },
                        );
                      }),
                      SizedBox(height: size.height * 0.01),
                      Obx(() {
                        return _buildDropDown(
                          hint: 'Choose your major',
                          value: controller.selectedMajor.value == 0
                              ? null
                              : controller.selectedMajor.value,
                          items: controller.dropdownMajors.toList().cast(),
                          onChanged: (value) {
                            FocusScope.of(context).requestFocus(FocusNode());
                            controller.onChangeMajor(value);
                          },
                          validator: (value) {
                            if (value == null) {
                              return 'Please choose your major';
                            }
                            return null;
                          },
                        );
                      }),
                      SizedBox(height: size.height * 0.02),
                      Container(
                        alignment: Alignment.centerRight,
                        margin:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(80.0)),
                            ),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(0)),
                          ),
                          onPressed: () {
                            if (signUpKey.currentState!.validate()) {
                              controller.onSubmitForm();
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 50.0,
                            width: size.width * 0.5,
                            decoration: new BoxDecoration(
                              borderRadius: BorderRadius.circular(80.0),
                              gradient: new LinearGradient(
                                colors: [
                                  Color(0xFF76B947),
                                  Color(0xFF94C973),
                                ],
                              ),
                            ),
                            padding: const EdgeInsets.all(0),
                            child: Text(
                              "SIGN UP",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropDown({
    required String hint,
    required dynamic value,
    List<DropdownMenuItem<dynamic>>? items,
    ValueChanged<dynamic>? onChanged,
    String? Function(dynamic)? validator,
  }) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: DropdownButtonFormField<dynamic>(
        validator: validator,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF2F5233)),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        hint: Text(hint),
        value: value,
        items: items,
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildTextFormField({
    required String labelText,
    String? Function(String?)? validator,
    String? hint = "",
    TextEditingController? controller,
    bool? readOnly = false,
    VoidCallback? onTapHandler,
    int? maxLength,
    TextInputType? keyboardType = TextInputType.text,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      alignment: Alignment.center,
      child: TextFormField(
        onTap: onTapHandler,
        readOnly: readOnly!,
        controller: controller,
        validator: validator,
        maxLength: maxLength,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          counterText: "",
          labelText: labelText,
          hintText: hint,
          labelStyle: TextStyle(
            color: Colors.black,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF2F5233)),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Future pickDate(BuildContext context) async {
    final newDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.day,
      firstDate: DateTime(1970),
      lastDate: DateTime.now(),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      confirmText: 'Select',
      builder: (ctx, child) => Theme(
        data: ThemeData.light().copyWith(
          colorScheme: ColorScheme.light().copyWith(
            primary: ColorConstants.primaryAppColor,
          ),
        ),
        child: child!,
      ),
    );
    if (newDate == null) return;
    controller.dobController.text = DateFormat('dd/MM/yyyy').format(newDate);
  }
}
