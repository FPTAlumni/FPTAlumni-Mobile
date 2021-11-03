import 'package:intl/intl.dart';

class FormatUtils {
  static DateTime fromddMMyyyyHHmmtoDateTime(String data) {
    return DateFormat('dd/MM/yyyy HH:mm').parse(data).toUtc();
  }

  // static String toddMMyyyyHHmmaaa(DateTime time) {
  //   return DateFormat('dd/MM/yyyy | HH:mm')
  //       .format(time.isUtc ? time.toLocal() : time);
  // }

  static String toddMMyyyy(DateTime time) {
    return DateFormat('dd/MM/yyyy').format(time.isUtc ? time.toLocal() : time);
  }

  static String toddMMyy(DateTime time) {
    return DateFormat('dd/MM/yy HH:mm')
        .format(time.isUtc ? time.toLocal() : time);
  }

  static String toddMMyyyyHHmm(DateTime time) {
    return DateFormat('dd/MM/yyyy | HH:mm')
        .format(time.isUtc ? time.toLocal() : time);
  }
}
