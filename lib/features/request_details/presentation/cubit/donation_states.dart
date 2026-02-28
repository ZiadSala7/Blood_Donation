abstract class DonationStates {}

class InitialDonation extends DonationStates {}

class LoadingDonation extends DonationStates {}

class FailureDonation extends DonationStates {
  final String errMsg;

  FailureDonation({required this.errMsg});
}

class SuccessDonation extends DonationStates {}
