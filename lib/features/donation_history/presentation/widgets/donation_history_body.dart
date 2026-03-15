import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/donation_history_cubit.dart';
import '../cubit/donation_history_states.dart';
import 'donation_history_content.dart';
import 'donation_history_error.dart';

class DonationHistoryBody extends StatelessWidget {
  const DonationHistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DonationHistoryCubit, DonationHistoryState>(
      builder: (context, state) {
        if (state is DonationHistoryLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is DonationHistoryError) {
          return DonationHistoryErrorWidget(message: state.message);
        }
        if (state is DonationHistoryLoaded) {
          return DonationHistoryContent(response: state.response);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
