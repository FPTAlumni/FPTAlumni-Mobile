import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class DateTimePickerDialog {
  static Future<DateTime?> showDatePickerDialog(
      {DateTime? selectedDate}) async {
    return await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate ?? DateTime.now(),
      initialDatePickerMode: DatePickerMode.day,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365 * 5)),
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
  }
}
