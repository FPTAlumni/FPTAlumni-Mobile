import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uni_alumni/modules/auth/auth_controller.dart';
import 'package:uni_alumni/modules/auth/widgets/background.dart';
import 'package:uni_alumni/shared/constants/assets.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class SignUpScreen extends GetView<AuthController> {
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
                        'ALUMNI',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorConstants.primaryAppColor,
                          fontSize: 30,
                          fontFamily: 'Poppins',
                          letterSpacing: 3,
                        ),
                      ),
                    ],
                  ),
                ),
                Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      _buildTextFormField(
                        labelText: 'Full name',
                        controller: controller.fullNameController,
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
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        child: DropdownButtonFormField<dynamic>(
                          validator: (value) {
                            if (value == null)
                              return 'Please choose your class';
                            return null;
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF2F5233)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          hint: Text('Please choose your class'),
                          value: controller.selectedClass.value == 0
                              ? null
                              : controller.selectedClass.value,
                          items: controller.dropdownClass,
                          onChanged: (value) {
                            controller
                                .onChangeClass(int.parse(value.toString()));
                          },
                        ),
                      ),
                      SizedBox(height: size.height * 0.05),
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
                            controller.onSubmitForm();
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

  Widget _buildTextFormField({
    required String labelText,
    String? Function(String?)? validator,
    String? hint = "",
    TextEditingController? controller,
    bool? readOnly = false,
    VoidCallback? onTapHandler,
  }) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextFormField(
        onTap: onTapHandler,
        readOnly: readOnly!,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
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
        ),
      ),
    );
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(DateTime.now().year - 50),
        lastDate: DateTime.now());
    if (newDate == null) return;
    controller.dobController.text = DateFormat('MM/dd/yyyy').format(newDate);
  }
}