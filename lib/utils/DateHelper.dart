import 'package:intl/intl.dart';

class DateHelper {
  String yearMonthDay({
    String date,
  }) {
    final DateTime parseDate =
        (date != null) ? DateFormat('yyyy-MM-dd').parse(date) : null;
    final String formatDate = (parseDate != null)
        ? DateFormat.yMMMMd().format(parseDate)
        : null;
    return formatDate;
  }
}
