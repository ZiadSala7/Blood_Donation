class RegisterModel {
  final String? token, name, email, cityName, governorateName, refreshToken;
  final DateTime? refreshTokenExpiration;

  RegisterModel({
    required this.token,
    required this.name,
    required this.email,
    this.cityName,
    this.governorateName,
    this.refreshToken,
    this.refreshTokenExpiration,
  });

  Map<String, dynamic> toJson() => {
    'token': token,
    'fullName': name,
    'email': email,
    'cityName': cityName,
    'governorateName': governorateName,
    'refreshToken': refreshToken,
    'refreshTokenExpiration': refreshTokenExpiration?.toIso8601String(),
  };

  factory RegisterModel.fromJson(Map<String, dynamic> jsonData) =>
      RegisterModel(
        token: jsonData['token'],
        name: jsonData['fullName'],
        email: jsonData['email'],
        cityName: jsonData['cityName'],
        governorateName: jsonData['governorateName'],
        refreshToken: jsonData['refreshToken'],
        refreshTokenExpiration: DateTime.parse(
          jsonData['refreshTokenExpiration'],
        ),
      );
}
