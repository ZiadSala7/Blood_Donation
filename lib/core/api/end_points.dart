class EndPoints {
  /// ================= BaseUrl ===============================
  static const String baseUrl = 'http://elixir.runasp.net/api/';

  /// ================= auth endpoints =========================
  static const String register = 'Authentication/register';
  static const String login = 'Authentication/login';
  static const String forgPass = 'Authentication/forget-otp';
  static const String verifyOtp = 'Authentication/verify-otp';
  static const String resetPass = 'Authentication/reset';

  /// ================== lookup API ============================
  static const String governorates = 'Lookup/governorates';
  static const String citiesInGovr = 'Lookup/governorate-cities';
  static const String bloodTypes = 'Lookup/blood-types';
  static const String donationCat = 'Lookup/donation-categories';

  /// ================== blood request API ====================
  static const String createBldRqust = 'Request/create';
  static const String getBldRqust = 'Request/requests';
  static const String getBldRqustById = 'Request/request';
  static const String closeBldRqust = 'Request/close';
  static const String deleteBldRqust = 'Request?RequestId=';

  /// ================= blood response API ===================
  static const String getRspnsToRqust = 'Request/Responses?RequestId=';
  static const String createRspnsToRqust = 'Response/respond?RequestId=';
  static const String confirmRqust =
      'Response/confirm?RequestId=8&DonorId={5b5fcbd4-f99e-4c71-7f58-08de5096cbeb}&HasDonated=';

  /// ================= notifications =========================
  static const String getAllNotifications = 'Notification/notifications';
  static const String getAllNorificationCnt =
      'Notification/notifications-count';
  static const String readNotification = 'Notification/read?Id=';
  static const String readAllNotifications = 'Notification/read-all';

  /// ================= account API ===========================
  static const String getUserProfile = 'Account/profile';
  static const String updateAccProfile = 'Account/profile';
  static const String changePass = 'Account/change-password';
  static const String refreshNtfctionTknAndLction = 'Account/location-fcm';
  static const String getDonationHstory = 'Account/donation-history';
}
