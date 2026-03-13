import '../../../home/data/models/request_model.dart';
import '../../../../core/utils/request_status_utils.dart';

class PersonalRequestResponse {
  final int pageSize;
  final int pageIndex;
  final int totalSize;
  final List<PersonalRequestItem> items;

  const PersonalRequestResponse({
    required this.pageSize,
    required this.pageIndex,
    required this.totalSize,
    required this.items,
  });

  factory PersonalRequestResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'] is List ? json['data'] as List : const [];
    return PersonalRequestResponse(
      pageSize: (json['pageSize'] as num?)?.toInt() ?? 0,
      pageIndex: (json['pageIndex'] as num?)?.toInt() ?? 1,
      totalSize: (json['totalSize'] as num?)?.toInt() ?? 0,
      items: data
          .whereType<Map<String, dynamic>>()
          .map(PersonalRequestItem.fromJson)
          .toList(),
    );
  }
}

class PersonalRequestItem {
  final RequestModel request;
  final List<ResponseDto> responses;

  const PersonalRequestItem({required this.request, required this.responses});

  factory PersonalRequestItem.fromJson(Map<String, dynamic> json) {
    final requestJson = json['bloodRequestDTo'] as Map<String, dynamic>? ?? {};
    final responsesJson = json['responsesDTos'] as List? ?? const [];
    return PersonalRequestItem(
      request: RequestModel.fromJson(requestJson),
      responses: responsesJson
          .whereType<Map<String, dynamic>>()
          .map(ResponseDto.fromJson)
          .toList(),
    );
  }
}

class ResponseDto {
  final String name;
  final RequestStatusType statusType;
  final DateTime? createdAt;
  final String? avatarText;
  final String? avatarColorHex;
  final String? donorId;

  const ResponseDto({
    required this.name,
    required this.statusType,
    this.createdAt,
    this.avatarText,
    this.avatarColorHex,
    this.donorId,
  });

  factory ResponseDto.fromJson(Map<String, dynamic> json) {
    final name =
        json['fullName']?.toString() ??
        json['donorName']?.toString() ??
        json['name']?.toString() ??
        '';
    final statusText =
        json['statusAr']?.toString() ?? json['status']?.toString();
    final statusCode = (json['responseStatus'] as num?)?.toInt();
    final statusType = statusCode != null
        ? _statusFromCode(statusCode)
        : parseRequestStatus(statusText);
    final createdAt = _parseDate(
      json['responseAt'] ?? json['createdAt'] ?? json['created_at'],
    );
    return ResponseDto(
      name: name,
      statusType: statusType,
      createdAt: createdAt,
      avatarText: name.isEmpty ? null : _initials(name),
      avatarColorHex: json['avatarColor']?.toString(),
      donorId: json['donorUserId']?.toString() ?? json['donorId']?.toString(),
    );
  }

  static RequestStatusType _statusFromCode(int code) {
    switch (code) {
      case 0:
        return RequestStatusType.pending;
      case 1:
        return RequestStatusType.inTransit;
      case 2:
        return RequestStatusType.completed;
      case 3:
        return RequestStatusType.closed;
      default:
        return RequestStatusType.unknown;
    }
  }

  static DateTime? _parseDate(dynamic value) {
    if (value == null) return null;
    if (value is DateTime) return value;
    return DateTime.tryParse(value.toString());
  }

  static String _initials(String name) {
    final trimmed = name.trim();
    if (trimmed.isEmpty) return '';
    return trimmed[0];
  }
}
