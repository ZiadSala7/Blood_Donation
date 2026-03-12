class DonationResponseModel {
  final bool? canResponse;
  final DateTime? lastDonationDate;
  final String? lastDonationCategory;
  final DateTime? nextDonationDate;
  final String? phoneNumber;

  const DonationResponseModel({
    this.canResponse,
    this.lastDonationDate,
    this.lastDonationCategory,
    this.nextDonationDate,
    this.phoneNumber,
  });

  factory DonationResponseModel.fromJson(Map<String, dynamic> json) {
    return DonationResponseModel(
      canResponse: json['canResponse'] as bool?,
      lastDonationDate: _parseDate(json['lastDonationDate']),
      lastDonationCategory: json['lastDonationCatrgory']?.toString(),
      nextDonationDate: _parseDate(json['nextDonationDate']),
      phoneNumber: json['phoneNumber']?.toString(),
    );
  }

  static DateTime? _parseDate(dynamic value) {
    if (value == null) return null;
    if (value is DateTime) return value;
    return DateTime.tryParse(value.toString());
  }
}
