

import 'package:intl/intl.dart';

class HelperFormat {
  static String? formattedCreatedDate(String? publishedDate) {
    var formatAll =
    DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(publishedDate ?? '');
    var formattedDate = DateFormat.yMMMd().format(formatAll);
    return formattedDate;
  }
}