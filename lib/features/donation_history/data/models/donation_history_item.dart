class DonationHistoryItem {
  final String? donationCategoryName;
  final DateTime donationDate;

  DonationHistoryItem({
    required this.donationCategoryName,
    required this.donationDate,
  });

  factory DonationHistoryItem.fromJson(Map<String, dynamic> json) {
    return DonationHistoryItem(
      donationCategoryName: json['donationCategoryName']?.toString(),
      donationDate: _parseUtcToLocal(json['donationDate']) ?? DateTime.now(),
    );
  }

  static DateTime? _parseUtcToLocal(dynamic value) {
    if (value == null) return null;
    if (value is DateTime) return value.toLocal();
    final raw = value.toString();
    if (raw.isEmpty) return null;
    final parsed = DateTime.tryParse(raw);
    if (parsed == null) return null;
    final hasTimezone =
        raw.contains('Z') || raw.contains('+') || raw.lastIndexOf('-') > 9;
    if (hasTimezone) return parsed.toLocal();
    return DateTime.utc(
      parsed.year,
      parsed.month,
      parsed.day,
      parsed.hour,
      parsed.minute,
      parsed.second,
      parsed.millisecond,
      parsed.microsecond,
    ).toLocal();
  }
}
