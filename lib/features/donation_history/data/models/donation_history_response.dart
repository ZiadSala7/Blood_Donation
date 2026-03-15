import 'donation_history_item.dart';

class DonationHistoryResponse {
  final int pageSize;
  final int pageIndex;
  final int totalSize;
  final List<DonationHistoryItem> items;

  DonationHistoryResponse({
    required this.pageSize,
    required this.pageIndex,
    required this.totalSize,
    required this.items,
  });

  factory DonationHistoryResponse.fromJson(Map<String, dynamic> json) {
    final list = json['data'] is List ? json['data'] as List : const [];
    return DonationHistoryResponse(
      pageSize: _intFrom(json['pageSize']) ?? 0,
      pageIndex: _intFrom(json['pageIndex']) ?? 1,
      totalSize: _intFrom(json['totalSize']) ?? list.length,
      items: list
          .whereType<Map<String, dynamic>>()
          .map(DonationHistoryItem.fromJson)
          .toList(),
    );
  }

  static int? _intFrom(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is num) return value.toInt();
    return int.tryParse(value.toString());
  }
}
