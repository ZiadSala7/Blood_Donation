import 'dart:convert';

import '../../../features/home/domain/entities/request_entity.dart';

class RequestUpdateUtils {
  const RequestUpdateUtils._();

  static bool hasMeaningfulChange(
    List<RequestEntity> entities,
    int requestId,
    dynamic data,
  ) {
    final current = _findEntity(entities, requestId);
    if (current == null) return false;
    final json = _extractRequestJson(data);
    if (json == null) return false;

    final status = json['status']?.toString();
    final bagsCount = _intFrom(json['bagsCount']);
    final collectedBags = _intFrom(json['collectedBags']);
    final responsesCount = _intFrom(json['responsesCount']);

    if (status != null && status != current.status) return true;
    if (bagsCount != null && bagsCount != current.bagsCnt) return true;
    if (collectedBags != null && collectedBags != current.collectedBags) {
      return true;
    }
    // Home entities don't track responsesCount, so any update that includes it
    // should trigger a refresh to keep UI in sync.
    if (responsesCount != null) return true;
    return false;
  }

  static RequestEntity? _findEntity(
    List<RequestEntity> entities,
    int requestId,
  ) {
    for (final entity in entities) {
      if (entity.id == requestId) return entity;
    }
    return null;
  }

  static Map<String, dynamic>? _extractRequestJson(dynamic data) {
    if (data == null) return null;
    if (data is Map<String, dynamic>) {
      if (data['bloodRequestDTo'] is Map) {
        return Map<String, dynamic>.from(data['bloodRequestDTo'] as Map);
      }
      return data;
    }
    if (data is String) {
      try {
        final decoded = jsonDecode(data);
        if (decoded is Map<String, dynamic>) return decoded;
      } catch (_) {}
    }
    return null;
  }

  static int? _intFrom(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is num) return value.toInt();
    return int.tryParse(value.toString());
  }
}
