import 'package:intl/intl.dart';

extension Dateparsing on String {
  String parseDate() {
    var todayDate = DateTime.parse(this);
    var formatter = DateFormat.yMMMMd('en_US');
    return formatter.format(todayDate);
  }
}
