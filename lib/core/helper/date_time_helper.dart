import 'package:intl/intl.dart';

/// get month name in arabic or english
String getMonthName(DateTime date, {bool isArabic = true}) {
  final locale = isArabic ? 'ar' : 'en';
  return DateFormat.MMMM(locale).format(date);
}

/// to get differences days between to DateTime
int daysBetween(DateTime from, DateTime to) {
  final fromDate = DateTime(from.year, from.month, from.day);
  final toDate = DateTime(to.year, to.month, to.day);

  return toDate.difference(fromDate).inDays;
}

/// always positive result
int absoluteDaysBetween(DateTime a, DateTime b) {
  return daysBetween(a, b).abs();
}

/// to display the datetime in 25-1-2026
String formatDateDMYLocale(DateTime date, {bool isArabic = true}) {
  final locale = isArabic ? 'ar' : 'en';
  return DateFormat('d-M-yyyy', locale).format(date);
}
