import 'package:intl/intl.dart';

extension DateHelpers on DateTime {
  bool isToday() {
    final now = DateTime.now();
    return now.day == day &&
        now.month == month &&
        now.year == year;
  }

  bool isYesterday() {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return yesterday.day == day &&
        yesterday.month == month &&
        yesterday.year == year;
  }
  String toDate(){
    String date = DateFormat.yMMMd().format(this);
    return date;
  }
  String toDay(){
    String day = DateFormat.EEEE().format(this);
    return day;
  }
  String toTime(){
    String time = DateFormat.jm().format(this);
    return time;
  }
}
