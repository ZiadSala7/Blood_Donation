class RegisterModel {
  final String? token, name, email, cityName, governorateName, refreshToken;
  final DateTime? refreshTokenExpiration;
  final int bloodTypeId;

  RegisterModel({
    required this.token,
    required this.name,
    required this.email,
    this.cityName,
    this.governorateName,
    this.refreshToken,
    this.refreshTokenExpiration,
    required this.bloodTypeId,
  });

  Map<String, dynamic> toJson() => {
    'token': token,
    'fullName': name,
    'email': email,
    'cityName': cityName,
    'governorateName': governorateName,
    'refreshToken': refreshToken,
    'refreshTokenExpiration': refreshTokenExpiration?.toIso8601String(),
    'bloodTypeId': bloodTypeId,
  };

  factory RegisterModel.fromJson(Map<String, dynamic> jsonData) =>
      RegisterModel(
        token: jsonData['token'],
        name: jsonData['fullName'],
        email: jsonData['email'],
        cityName: jsonData['cityName'],
        governorateName: jsonData['governorateName'],
        refreshToken: jsonData['refreshToken'],
        refreshTokenExpiration: _parseDateTime(
          jsonData['refreshTokenExpiration'],
        ),
        bloodTypeId: (jsonData['bloodTypeId'] as num?)?.toInt() ?? 0,
      );

  static DateTime? _parseDateTime(dynamic value) {
    if (value is DateTime) return value;
    if (value is String && value.isNotEmpty) {
      return DateTime.tryParse(value);
    }
    return null;
  }
}
