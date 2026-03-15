import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../generated/l10n.dart';
import '../../../home/data/models/request_model.dart';
import '../cubit/donation_cubit.dart';
import 'case_details_card.dart';
import 'header_card.dart';
import 'progress_card.dart';
import 'requester_card.dart';
import 'stats_card.dart';

class RequestDetailsViewBody extends StatelessWidget {
  const RequestDetailsViewBody({
    super.key,
    required this.request,
    required this.isOpen,
    required this.isLoading,
  });

  final RequestModel request;
  final bool isOpen;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        HeaderCard(request),
        const SizedBox(height: 12),
        Card(
          color: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              spacing: 15,
              children: [
                StatsCard(request),
                ProgressCard(request),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        CaseDetailsCard(request),
        const SizedBox(height: 12),
        RequesterCard(request),
        const SizedBox(height: 12),
        CustomButton(
          onPressed: isOpen && !isLoading
              ? () => context.read<DonationCubit>().donateTo(
                  id: request.id!,
                )
              : null,
          label: S.of(context).donateNow,
        ),
      ],
    );
  }
}
