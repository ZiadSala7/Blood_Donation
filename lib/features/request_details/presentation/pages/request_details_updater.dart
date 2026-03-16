import 'dart:convert';

import '../../../home/data/models/request_model.dart';

class RequestDetailsUpdater {
  RequestModel apply(RequestModel current, dynamic data) {
    final json = _extractRequestJson(data);
    if (json == null) return current;
    return RequestModel(
      id: current.id,
      status: json['status']?.toString() ?? current.status,
      patientName: json['patientName']?.toString() ?? current.patientName,
      hospitalName: json['hospitalName']?.toString() ?? current.hospitalName,
      description: json['description']?.toString() ?? current.description,
      bagsCount: _intFrom(json['bagsCount']) ?? current.bagsCount,
      responsesCount: _intFrom(json['responsesCount']) ?? current.responsesCount,
      collectedBags: _intFrom(json['collectedBags']) ?? current.collectedBags,
      phoneNumber: json['phoneNumber']?.toString() ?? current.phoneNumber,
      latitude: _doubleFrom(json['latitude']) ?? current.latitude,
      longitude: _doubleFrom(json['longitude']) ?? current.longitude,
      createdAt: _parseDate(json['createdAt']) ?? current.createdAt,
      requesterName:
          json['requesterName']?.toString() ?? current.requesterName,
      donationCategoryAr:
          json['donationCategoryAr']?.toString() ?? current.donationCategoryAr,
      requiredBloodType:
          json['requiredBloodType']?.toString() ?? current.requiredBloodType,
      cityAr: json['cityAr']?.toString() ?? current.cityAr,
      cityEn: json['cityEn']?.toString() ?? current.cityEn,
      deadline: _parseDate(json['deadline']) ?? current.deadline,
    );
  }

  Map<String, dynamic>? _extractRequestJson(dynamic data) {
    if (data == null) return null;
    if (data is Map<String, dynamic>) {
      if (data['bloodRequestDTo'] is Map) {
        return Map<String, dynamic>.from(data['bloodRequestDTo'] as Map);
      }
      return data;
    }
    if (data is String) {
      try {
        final decoded = jsonDecode(data);
        if (decoded is Map<String, dynamic>) return decoded;
      } catch (_) {}
    }
    return null;
  }

  int? _intFrom(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is num) return value.toInt();
    return int.tryParse(value.toString());
  }

  double? _doubleFrom(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is num) return value.toDouble();
    return double.tryParse(value.toString());
  }

  DateTime? _parseDate(dynamic value) {
    if (value == null) return null;
    if (value is DateTime) return value;
    return DateTime.tryParse(value.toString());
  }
}
