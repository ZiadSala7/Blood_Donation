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
  DateTime? deadline;

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
      patientName: json['patientName'] as String?,
      hospitalName: json['hospitalName'] as String?,
      description: json['description'] as String?,
      bagsCount: json['bagsCount'] as int?,
      responsesCount: json['responsesCount'] as int?,
      collectedBags: json['collectedBags'] as int?,
      phoneNumber: json['phoneNumber'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      requesterName: json['requesterName'] as String?,
      donationCategoryAr: json['donationCategoryAr'] as String?,
      requiredBloodType: json['requiredBloodType'] as String?,
      cityAr: json['cityAr'] as String?,
      cityEn: json['cityEn'] as String?,
      deadline: DateTime.parse(json['deadline']),
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
