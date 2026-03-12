import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import 'app_colors.dart';

enum RequestStatusType {
  open,
  closed,
  completed,
  inTransit,
  pending,
  unknown,
}

RequestStatusType parseRequestStatus(String? status) {
  if (status == null) return RequestStatusType.unknown;
  final normalized = status.trim().toLowerCase();
  if (normalized.isEmpty) return RequestStatusType.unknown;
  if (normalized == 'open' || status == 'مفتوح') {
    return RequestStatusType.open;
  }
  if (normalized == 'closed' || status == 'مغلق') {
    return RequestStatusType.closed;
  }
  if (normalized == 'completed' || status == 'مكتمل') {
    return RequestStatusType.completed;
  }
  if (normalized == 'in_transit' || normalized == 'intransit' || status == 'في الطريق') {
    return RequestStatusType.inTransit;
  }
  if (normalized == 'pending' || status == 'قيد الانتظار') {
    return RequestStatusType.pending;
  }
  return RequestStatusType.unknown;
}

RequestStatusType resolveRequestStatus({
  required DateTime? deadline,
  required int total,
  required int collected,
  required String? status,
}) {
  final safeTotal = total <= 0 ? 1 : total;
  final progress = (collected / safeTotal).clamp(0.0, 1.0);
  if (deadline != null && DateTime.now().isAfter(deadline)) {
    return progress >= 1.0
        ? RequestStatusType.completed
        : RequestStatusType.closed;
  }
  return parseRequestStatus(status);
}

String statusLabel(BuildContext context, RequestStatusType type) {
  final s = S.of(context);
  switch (type) {
    case RequestStatusType.open:
      return s.statusOpen;
    case RequestStatusType.closed:
      return s.statusClosed;
    case RequestStatusType.completed:
      return s.statusCompleted;
    case RequestStatusType.inTransit:
      return s.statusInTransit;
    case RequestStatusType.pending:
      return s.statusPending;
    case RequestStatusType.unknown:
      return s.statusUnknown;
  }
}

Color statusColor(RequestStatusType type) {
  switch (type) {
    case RequestStatusType.open:
      return AppColors.openStatus;
    case RequestStatusType.closed:
      return Colors.grey;
    case RequestStatusType.completed:
      return Colors.green;
    case RequestStatusType.inTransit:
      return Colors.green;
    case RequestStatusType.pending:
      return Colors.orange;
    case RequestStatusType.unknown:
      return AppColors.commonClr;
  }
}

bool isOpenStatus(RequestStatusType type) => type == RequestStatusType.open;
