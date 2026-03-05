class TownModel {
  final int? id, govrnId;
  final String? nameEn, nameAr;

  TownModel({
    required this.id,
    required this.govrnId,
    required this.nameEn,
    required this.nameAr,
  });

  factory TownModel.fromJson(Map<String, dynamic> jsonDate) => TownModel(
    id: jsonDate['id'],
    govrnId: jsonDate['governorateId'],
    nameEn: jsonDate['nameEn'],
    nameAr: jsonDate['nameAr'],
  );
}
