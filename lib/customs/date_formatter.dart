

import 'package:intl/intl.dart';

String formatDate(String? date, String format) {
  if (date != null && DateTime.tryParse(date) != null) {
    return DateFormat(format).format(DateTime.parse(date));
  }
  return '';
}
