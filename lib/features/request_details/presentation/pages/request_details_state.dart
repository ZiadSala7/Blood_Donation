import '../../../home/data/models/request_model.dart';
import '../cubit/donation_cubit.dart';

class RequestDetailsState {
  final RequestModel request;
  final DonationCubit donationCubit;

  const RequestDetailsState({
    required this.request,
    required this.donationCubit,
  });

  RequestDetailsState copyWith({RequestModel? request}) {
    return RequestDetailsState(
      request: request ?? this.request,
      donationCubit: donationCubit,
    );
  }
}
