abstract class AppConstants {
  static final List<String> ages = List.generate(
    83,
    (index) => '${index + 18}',
  );
  static final List<String> bloodTypes = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];
}
