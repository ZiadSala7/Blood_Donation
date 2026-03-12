import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repo/donation_repo.dart';
import 'donation_states.dart';

class DonationCubit extends Cubit<DonationStates> {
  final DonationRepo repo;
  DonationCubit(this.repo) : super(InitialDonation());

  Future<void> donateTo({required int id}) async {
    emit(LoadingDonation());
    final response = await repo.donateTo(id: id);
    response.fold(
      (err) => emit(FailureDonation(errMsg: err)),
      (data) => emit(
        SuccessDonation(
          message: "يمكنك الآن التوجه للتبرع",
          phoneNumber: data.phoneNumber,
        ),
      ),
    );
  }
}
