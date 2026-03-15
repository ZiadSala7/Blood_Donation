import '../../data/models/donation_history_response.dart';

abstract class DonationHistoryState {}

class DonationHistoryInitial extends DonationHistoryState {}

class DonationHistoryLoading extends DonationHistoryState {}

class DonationHistoryLoaded extends DonationHistoryState {
  final DonationHistoryResponse response;

  DonationHistoryLoaded(this.response);
}

class DonationHistoryError extends DonationHistoryState {
  final String message;

  DonationHistoryError({required this.message});
}
