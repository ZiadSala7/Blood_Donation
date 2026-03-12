import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

String timeAgoFromDateTime(BuildContext context, DateTime dateTime) {
  final now = DateTime.now();
  final diff = now.difference(dateTime);
  final s = S.of(context);

  if (diff.isNegative) return s.timeAgoNow;
  if (diff.inSeconds < 60) return s.timeAgoNow;
  if (diff.inMinutes < 60) {
    return s.timeAgoMinutes(diff.inMinutes);
  }
  if (diff.inHours < 24) {
    return s.timeAgoHours(diff.inHours);
  }
  if (diff.inDays == 1) return s.timeAgoDay;
  if (diff.inDays == 2) return s.timeAgoTwoDays;
  if (diff.inDays < 31) return s.timeAgoDays(diff.inDays);
  if (diff.inDays < 60) return s.timeAgoMonth;
  if (diff.inDays < 365) {
    return s.timeAgoMonths((diff.inDays / 30).floor());
  }
  return s.timeAgoYears((diff.inDays / 365).floor());
}
