import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/l10n.dart';
import '../cubit/donation_history_cubit.dart';

class DonationHistoryErrorWidget extends StatelessWidget {
  final String message;

  const DonationHistoryErrorWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            TextButton.icon(
              onPressed: () =>
                  context.read<DonationHistoryCubit>().loadHistory(),
              icon: const Icon(Icons.refresh),
              label: Text(S.of(context).retryLabel),
            ),
          ],
        ),
      ),
    );
  }
}
