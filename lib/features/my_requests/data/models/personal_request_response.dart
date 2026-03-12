import '../../../home/data/models/request_model.dart';

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
  final String status;
  final DateTime? createdAt;
  final String? avatarText;
  final String? avatarColorHex;

  const ResponseDto({
    required this.name,
    required this.status,
    this.createdAt,
    this.avatarText,
    this.avatarColorHex,
  });

  factory ResponseDto.fromJson(Map<String, dynamic> json) {
    final name =
        json['donorName']?.toString() ?? json['name']?.toString() ?? 'متبرع';
    final status =
        json['statusAr']?.toString() ??
        json['status']?.toString() ??
        'قيد الانتظار';
    final createdAt = _parseDate(json['createdAt'] ?? json['created_at']);
    return ResponseDto(
      name: name,
      status: status,
      createdAt: createdAt,
      avatarText: _initials(name),
      avatarColorHex: json['avatarColor']?.toString(),
    );
  }

  static DateTime? _parseDate(dynamic value) {
    if (value == null) return null;
    if (value is DateTime) return value;
    return DateTime.tryParse(value.toString());
  }

  static String _initials(String name) {
    final trimmed = name.trim();
    if (trimmed.isEmpty) return 'م';
    return trimmed[0];
  }
}
