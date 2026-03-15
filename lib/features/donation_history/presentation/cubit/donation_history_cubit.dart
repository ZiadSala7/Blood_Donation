import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repo/donation_history_repo.dart';
import 'donation_history_states.dart';

class DonationHistoryCubit extends Cubit<DonationHistoryState> {
  final DonationHistoryRepo repo;

  DonationHistoryCubit(this.repo) : super(DonationHistoryInitial());

  Future<void> loadHistory({int pageIndex = 1, int pageSize = 20}) async {
    emit(DonationHistoryLoading());
    final result = await repo.getDonationHistory(
      pageIndex: pageIndex,
      pageSize: pageSize,
    );
    result.fold(
      (err) => emit(DonationHistoryError(message: err)),
      (data) => emit(DonationHistoryLoaded(data)),
    );
  }
}
