class RequestModel {
  int? id;
  String? status;
  String? patientName;
  String? hospitalName;
  String? description;
  int? bagsCount;
  int? responsesCount;
  int? collectedBags;
  String? phoneNumber;
  double? latitude;
  double? longitude;
  DateTime? createdAt;
  String? requesterName;
  String? donationCategoryAr;
  String? requiredBloodType;
  String? cityAr;
  String? cityEn;
  String? deadline;

  RequestModel({
    this.id,
    this.status,
    this.patientName,
    this.hospitalName,
    this.description,
    this.bagsCount,
    this.responsesCount,
    this.collectedBags,
    this.phoneNumber,
    this.latitude,
    this.longitude,
    this.createdAt,
    this.requesterName,
    this.donationCategoryAr,
    this.requiredBloodType,
    this.cityAr,
    this.cityEn,
    this.deadline,
  });

  // fromJson
  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
      id: json['id'] as int?,
      status: json['status'] as String?,
      patientName: json['patient_name'] as String?,
      hospitalName: json['hospital_name'] as String?,
      description: json['description'] as String?,
      bagsCount: json['bags_count'] as int?,
      responsesCount: json['responses_count'] as int?,
      collectedBags: json['collected_bags'] as int?,
      phoneNumber: json['phone_number'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      requesterName: json['requester_name'] as String?,
      donationCategoryAr: json['donation_category_ar'] as String?,
      requiredBloodType: json['required_blood_type'] as String?,
      cityAr: json['city_ar'] as String?,
      cityEn: json['city_en'] as String?,
      deadline: json['deadline'] as String?,
    );
  }

  // toJson
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'patient_name': patientName,
      'hospital_name': hospitalName,
      'description': description,
      'bags_count': bagsCount,
      'responses_count': responsesCount,
      'collected_bags': collectedBags,
      'phone_number': phoneNumber,
      'latitude': latitude,
      'longitude': longitude,
      'created_at': createdAt?.toIso8601String(),
      'requester_name': requesterName,
      'donation_category_ar': donationCategoryAr,
      'required_blood_type': requiredBloodType,
      'city_ar': cityAr,
      'city_en': cityEn,
      'deadline': deadline,
    };
  }
}
