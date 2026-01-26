class ErrorModel {
  int? status;
  String? errorMessage;
  List<dynamic>? errors;

  ErrorModel({
    required this.status,
    required this.errorMessage,
    required this.errors,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) => ErrorModel(
    status: jsonData['statusCode'],
    errorMessage: jsonData['errorMessage'],
    errors: jsonData['errors'] ?? [],
  );
}
