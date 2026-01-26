class RegisterModel {
  final String? token, name, email;

  RegisterModel({required this.token, required this.name, required this.email});

  Map<String, dynamic> toJson() => {
    'token': token,
    'fullName': name,
    'email': email,
  };

  factory RegisterModel.fromJson(Map<String, dynamic> jsonData) =>
      RegisterModel(
        token: jsonData['token'],
        name: jsonData['fullName'],
        email: jsonData['email'],
      );
}
