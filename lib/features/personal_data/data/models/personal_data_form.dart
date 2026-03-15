class PersonalDataForm {
  final String name;
  final String email;
  final String bloodType;
  final String phoneNumber;
  final String? governorate;
  final String? town;

  const PersonalDataForm({
    required this.name,
    required this.email,
    required this.bloodType,
    required this.phoneNumber,
    required this.governorate,
    required this.town,
  });

  PersonalDataForm copyWith({
    String? name,
    String? email,
    String? bloodType,
    String? phoneNumber,
    String? governorate,
    String? town,
  }) {
    return PersonalDataForm(
      name: name ?? this.name,
      email: email ?? this.email,
      bloodType: bloodType ?? this.bloodType,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      governorate: governorate ?? this.governorate,
      town: town ?? this.town,
    );
  }
}
