import 'package:intl/intl.dart';

String getCurrentDate() {
  // Get the current date
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('E, d\'th\' MMMM yyyy').format(now);
  return formattedDate;
}
