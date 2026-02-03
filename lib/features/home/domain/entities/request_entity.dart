class RequestEntity {
  int? id, bagsCnt, collectedBags;
  String? status, patientName, hospitalName, cityAr, donationCategoryAr, requiredBloodType;
  DateTime? deadline;

  RequestEntity({
    required this.id,
    required this.bagsCnt,
    required this.collectedBags,
    required this.status,
    required this.patientName,
    required this.hospitalName,
    required this.cityAr,
    required this.deadline,
    required this.donationCategoryAr,
    required this.requiredBloodType
  });
}
