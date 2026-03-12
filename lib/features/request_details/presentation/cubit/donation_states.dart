abstract class DonationStates {}

class InitialDonation extends DonationStates {}

class LoadingDonation extends DonationStates {}

class FailureDonation extends DonationStates {
  final String errMsg;

  FailureDonation({required this.errMsg});
}

class SuccessDonation extends DonationStates {
  final String message;
  final String? phoneNumber;

  SuccessDonation({required this.message, this.phoneNumber});
}
