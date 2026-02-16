class UserProfileModel {
  final String name;
  final String phone;
  final String city;
  final String bloodType;
  final DateTime? lastDonation;
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
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    final name = json['fullName'] ?? json['name'] ?? json['fullNameAr'] ?? '';
    final phone = json['phoneNumber'] ?? json['phone'] ?? json['PhoneNumber'] ?? '';
    final city = json['cityName'] ?? json['city'] ?? json['governorateName'] ?? '';
    final bloodType = json['bloodType'] ?? json['bloodTypeName'] ?? json['BloodType'] ?? 'A+';
    final donations = json['donationsCount'] ?? json['donationCount'] ?? 0;
    final requests = json['requestsCount'] ?? json['helpCasesCount'] ?? json['helpCases'] ?? 0;

    DateTime? lastDonation;
    final dateStr = json['lastDonationDate'] ?? json['lastDonation'] ?? json['date'];
    if (dateStr != null) {
      if (dateStr is DateTime) {
        lastDonation = dateStr;
      } else if (dateStr is String) {
        lastDonation = DateTime.tryParse(dateStr);
      }
    }

    return UserProfileModel(
      name: name.toString(),
      phone: phone.toString(),
      city: city.toString(),
      bloodType: bloodType.toString(),
      lastDonation: lastDonation ?? DateTime.now(),
      donationsCount: (donations is int) ? donations : int.tryParse(donations.toString()) ?? 0,
      requestsCount: (requests is int) ? requests : int.tryParse(requests.toString()) ?? 0,
    );
  }
}
