import 'package:intl/intl.dart';

class FormatUtils {
  static DateTime fromddMMyyyyHHmmtoDateTime(String data) {
    return DateFormat('dd/MM/yyyy HH:mm').parse(data);
  }

  static String toddMMyyyyHHmmaaa(DateTime time) {
    return DateFormat('dd/MM/yyyy | HH:mm aaa')
        .format(time.isUtc ? time.toLocal() : time);
  }

  static String toddMMyyyy(DateTime time) {
    return DateFormat('dd/MM/yyyy').format(time.isUtc ? time.toLocal() : time);
  }
}
