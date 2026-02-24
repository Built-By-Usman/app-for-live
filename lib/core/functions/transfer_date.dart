import 'package:intl/intl.dart';




String transferDateAMPM(DateTime date) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = today.subtract(const Duration(days: 1));
  final messageDate = DateTime(date.year, date.month, date.day);

  if (messageDate == today) {
    return DateFormat.jm().format(date); // 3:45 PM
  } else if (messageDate == yesterday) {
    return "Yesterday ${DateFormat.jm().format(date)}";
  } else {
    return DateFormat.yMMMd().add_jm().format(date); // Jan 20, 3:45 PM
  }
}



bool isSameDay(DateTime d1, DateTime d2) {
  return d1.year == d2.year && d1.month == d2.month && d1.day == d2.day;
}

String getDateHeader(DateTime date) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = today.subtract(const Duration(days: 1));
  final msgDay = DateTime(date.year, date.month, date.day);

  if (msgDay == today) return "Today";
  if (msgDay == yesterday) return "Yesterday";
  return DateFormat.yMMMd().format(date);
}