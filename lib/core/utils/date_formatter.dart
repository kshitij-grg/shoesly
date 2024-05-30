import 'package:intl/intl.dart';

class DateFormatter {
  static String dateFormat(
          {required DateTime? dateTime, String format = "y-MM-dd"}) =>
      DateFormat(format).format(dateTime ?? DateTime.now());

  static String getLocalTimeFormat({required String? dateTime}) =>
      DateFormat.jm()
          .format(DateTime.parse("${dateTime ?? DateTime.now()}").toLocal());

  static String getUtcIsoDateTime({required DateTime dateTime}) {
    var currentDate = DateTime.now();
    return DateTime(dateTime.year, dateTime.month, dateTime.day,
            currentDate.hour, currentDate.minute, currentDate.second)
        .toUtc()
        .toIso8601String();
  }

  static String timeAgo(DateTime? d) {
    Duration diff = DateTime.now().difference(d!);
    if (diff.inDays > 365) {
      return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "y" : "y"} ago";
    }
    if (diff.inDays > 30) {
      return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "m" : "m"} ago";
    }
    if (diff.inDays > 7) {
      return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "w" : "w"} ago";
    }
    if (diff.inDays > 0) {
      return "${diff.inDays} ${diff.inDays == 1 ? "d" : "d"} ago";
    }
    if (diff.inHours > 0) {
      return "${diff.inHours} ${diff.inHours == 1 ? "h" : "h"} ago";
    }
    if (diff.inMinutes > 0) {
      return "${diff.inMinutes} ${diff.inMinutes == 1 ? "min" : "min"} ago";
    }
    return "Just now";
  }
}
