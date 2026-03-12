import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

abstract class AppConstants {
  static final List<String> ages = List.generate(
    83,
    (index) => '${index + 18}',
  );
  static final List<String> bloodTypes = [
    "A+",
    'A-',
    'B+',
    "B-",
    'AB+',
    "AB-",
    'O+',
    "O-",
  ];

  static final PageController onbrdngPageCntroller = PageController();
  static String get errMsg => S.current.genericLoadError;
}
