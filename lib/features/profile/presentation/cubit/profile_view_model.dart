import 'package:flutter/material.dart';

class ProfileViewModel extends ChangeNotifier {
  // 🔹 Temporary local data
  String name = 'Somaya Asaad';
  String phone = '0100 000 000';
  String city = 'سوهاج، سوهاج';
  String bloodType = 'A+';
  DateTime lastDonationDate = DateTime(2026, 2, 1);

  int donationsCount = 3;
  int requestsCount = 5;

  // 🔹 Later replace this with API
  void loadProfile() {
    notifyListeners();
  }
}
