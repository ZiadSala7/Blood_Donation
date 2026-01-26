class LoginErrorModel {
  final int statusCode;
  final String errMsg;

  LoginErrorModel({required this.statusCode, required this.errMsg});

  factory LoginErrorModel.fromJson(Map<String, dynamic> jsonData) =>
      LoginErrorModel(
        statusCode: jsonData['statusCode'],
        errMsg: jsonData['errorMessage'],
      );
}
