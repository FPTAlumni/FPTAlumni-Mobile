import 'package:intl/intl.dart';

class FormatUtils {
  static DateTime fromddMMyyyyHHmmtoDateTime(String data) {
    return DateFormat('dd/MM/yyyy HH:mm').parse(data);
  }
}
