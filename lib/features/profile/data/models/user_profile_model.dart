class UserProfileModel {
  final String name;
  final String phone;
  final String city;
  final String bloodType;
  final DateTime lastDonation;
  final int donationsCount;
  final int requestsCount;

  UserProfileModel({
    required this.name,
    required this.phone,
    required this.city,
    required this.bloodType,
    required this.lastDonation,
    required this.donationsCount,
    required this.requestsCount,
  });
}
