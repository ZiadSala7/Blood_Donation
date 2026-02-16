/// Arabic relative time strings for notification "time ago" display.
String timeAgoFromDateTime(DateTime dateTime) {
  final now = DateTime.now();
  final diff = now.difference(dateTime);

  if (diff.inSeconds < 60) return 'الآن';
  if (diff.inMinutes < 60) return 'منذ ${diff.inMinutes} دقيقة';
  if (diff.inHours < 24) return 'منذ ${diff.inHours} ساعة';
  if (diff.inDays == 1) return 'منذ يوم';
  if (diff.inDays == 2) return 'منذ يومان';
  if (diff.inDays < 31) return 'منذ ${diff.inDays} يوم';
  if (diff.inDays < 60) return 'منذ شهر';
  if (diff.inDays < 365) return 'منذ ${(diff.inDays / 30).floor()} أشهر';
  return 'منذ ${(diff.inDays / 365).floor()} سنة';
}
