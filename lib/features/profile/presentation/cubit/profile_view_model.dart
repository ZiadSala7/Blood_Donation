import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../../../../core/api/api_keys.dart';
import '../../../../core/databases/cach_helper.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/helper/get_user.dart';
import '../../../../core/utils/app_routes.dart';
import '../../data/models/user_profile_model.dart';
import '../../data/repo/profile_repo_impl.dart';

class ProfileViewModel extends ChangeNotifier {
  final ProfileRepoImpl repo;
  bool _isLoading = true;
  String? _error;

  UserProfileModel? _profile;
  String _name = '';
  String _phone = '';
  String _city = '';
  String _bloodType = 'A+';
  DateTime? _lastDonationDate;
  int _donationsCount = 0;
  int _requestsCount = 0;

  ProfileViewModel({required this.repo});

  bool get isLoading => _isLoading;
  String? get error => _error;
  String get name => _name;
  String get phone => _phone;
  String get city => _city;
  String get bloodType => _bloodType;
  DateTime? get lastDonationDate => _lastDonationDate;
  int get donationsCount => _donationsCount;
  int get requestsCount => _requestsCount;
  UserProfileModel? get profile => _profile;

  String get formattedLastDonationDate {
    if (_lastDonationDate == null) return '-';
    return DateFormat('d MMMM yyyy', 'ar').format(_lastDonationDate!);
  }

  Future<void> loadProfile() async {
    await initializeDateFormatting('ar', null);
    _isLoading = true;
    _error = null;
    notifyListeners();

    final apiProfile = await repo.getProfile();
    if (apiProfile != null) {
      _profile = apiProfile;
      _name = apiProfile.name;
      _phone = apiProfile.phone;
      _city = apiProfile.city;
      _bloodType = apiProfile.bloodType;
      _lastDonationDate = apiProfile.lastDonation;
      _donationsCount = apiProfile.donationsCount;
      _requestsCount = apiProfile.requestsCount;
    } else {
      // Fallback to cached user
      final cachedUser = getCachedUser();
      if (cachedUser != null) {
        _name = cachedUser.name ?? '';
        _phone = cachedUser.email ?? '';
        _city = '${cachedUser.cityName ?? ''}، ${cachedUser.governorateName ?? ''}'.trim();
        if (_city == '،') _city = '-';
        _bloodType = 'A+';
        _lastDonationDate = DateTime.now();
        _donationsCount = 0;
        _requestsCount = 0;
      }
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> logout(BuildContext context) async {
    final prefs = getIt.get<CacheHelper>();
    await prefs.setBool('rememberMe', false);
    await prefs.remove('user');
    await prefs.remove(ApiKeys.token);
    if (!context.mounted) return;
    GoRouter.of(context).replaceNamed(AppRoutes.loginName);
  }
}
