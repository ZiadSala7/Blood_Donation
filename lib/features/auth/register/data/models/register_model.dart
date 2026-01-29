class RegisterModel {
  final String? token, name, email, cityName, governorateName;

  RegisterModel({
    required this.token,
    required this.name,
    required this.email,
    this.cityName,
    this.governorateName,
  });

  Map<String, dynamic> toJson() => {
    'token': token,
    'fullName': name,
    'email': email,
    'cityName': cityName,
    'governorateName': governorateName,
  };

  factory RegisterModel.fromJson(Map<String, dynamic> jsonData) =>
      RegisterModel(
        token: jsonData['token'],
        name: jsonData['fullName'],
        email: jsonData['email'],
        cityName: jsonData['cityName'],
        governorateName: jsonData['governorateName'],
      );
}
