import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class CustomDateTimePicker extends CommonPickerModel {
  DateTime? maxTime;
  DateTime? minTime;

  String digits(int value, int length) {
    return '$value'.padLeft(length, "0");
  }

  CustomDateTimePicker({
    DateTime? currentTime,
    LocaleType? locale,
    DateTime? maxTime,
    DateTime? minTime,
  }) : super(locale: locale) {
    this.currentTime = currentTime ?? DateTime.now();
    this.maxTime = maxTime ?? DateTime.now().add(Duration(days: 365 * 10));
    this.minTime = minTime ?? DateTime.now().subtract(Duration(days: 365 * 1));
    this.setLeftIndex(this.currentTime.day);
    this.setMiddleIndex(this.currentTime.hour);
    this.setRightIndex(this.currentTime.minute);

    if (currentTime!.compareTo(this.maxTime!) > 0) {
      currentTime = this.maxTime;
    } else if (currentTime.compareTo(this.minTime!) < 0) {
      currentTime = this.minTime;
    }
  }

  @override
  String? leftStringAtIndex(int index) {
    DateTime time = currentTime.add(Duration(days: index - currentTime.day));

    if (index == currentTime.day) return "Today";

    if (time.isBefore(maxTime!.add(Duration(days: 1))) &&
        time.isAfter(minTime!)) {
      return '${digits(time.day, 2)}/${digits(time.month, 2)}/${time.year}';
    }

    return null;
  }

  @override
  String? middleStringAtIndex(int index) {
    if (index >= 0 && index < 24) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String? rightStringAtIndex(int index) {
    if (index >= 0 && index < 60) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String leftDivider() {
    return "";
  }

  @override
  String rightDivider() {
    return ":";
  }

  @override
  List<int> layoutProportions() {
    return [4, 1, 1];
  }

  @override
  DateTime finalTime() {
    DateTime selectedDate = currentTime
        .add(Duration(days: this.currentLeftIndex() - currentTime.day));
    return currentTime.isUtc
        ? DateTime.utc(
            selectedDate.year,
            selectedDate.month,
            selectedDate.day,
            this.currentMiddleIndex(),
            this.currentRightIndex(),
            DateTime.now().second,
          )
        : DateTime(
            selectedDate.year,
            selectedDate.month,
            selectedDate.day,
            this.currentMiddleIndex(),
            this.currentRightIndex(),
            DateTime.now().second,
          );
  }
}
