class UserProfileModel {
  final String name;
  final String phone;
  final String city;
  final String bloodType;
  final DateTime? lastDonation, dateOfBirth;
  final int donationsCount;
  final int requestsCount;

  UserProfileModel({
    required this.name,
    required this.phone,
    required this.city,
    required this.bloodType,
    this.lastDonation,
    required this.donationsCount,
    required this.requestsCount, 
    required this.dateOfBirth,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    final name = json['fullName'] ?? json['name'] ?? json['fullNameAr'] ?? '';
    final phone = json['phoneNumber'] ?? json['phone'] ?? json['PhoneNumber'] ?? '';
    final city = json['cityName'] ?? json['city'] ?? json['governorateName'] ?? '';
    final bloodType = json['bloodType'] ?? json['bloodTypeName'] ?? json['BloodType'] ?? 'A+';
    final donations = json['donationsCount'] ?? json['donationCount'] ?? 0;
    final requests = json['requestsCount'] ?? json['helpCasesCount'] ?? json['helpCases'] ?? 0;

    final lastDonation = _parseDateTime(
      json['lastDonationDate'] ?? json['lastDonation'] ?? json['date'],
    );
    final dateOfBirth = _parseDateTime(
      json['dateOfBirth'] ?? json['birthDate'] ?? json['dob'],
    );

    return UserProfileModel(
      name: name.toString(),
      phone: phone.toString(),
      city: city.toString(),
      bloodType: bloodType.toString(),
      lastDonation: lastDonation ?? DateTime.now(),
      donationsCount: (donations is int) ? donations : int.tryParse(donations.toString()) ?? 0,
      requestsCount: (requests is int) ? requests : int.tryParse(requests.toString()) ?? 0,
      dateOfBirth: dateOfBirth,
    );
  }

  static DateTime? _parseDateTime(dynamic value) {
    if (value is DateTime) return value;
    if (value is String && value.isNotEmpty) return DateTime.tryParse(value);
    return null;
  }
}
