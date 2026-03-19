import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/api/dio_consumer.dart';
import '../../../../../core/di/injection.dart';
import '../../../../../core/utils/request_status_utils.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/show_awesome_dialog.dart';
import '../../../../../generated/l10n.dart';
import '../../../../request_details/data/repo/donation_repo_impl.dart';
import '../../../../request_details/presentation/cubit/donation_cubit.dart';
import '../../../../request_details/presentation/cubit/donation_states.dart';
import '../../../domain/entities/request_entity.dart';
import 'request_deadline.dart';
import 'see_more_button.dart';
import 'slider_and_progress_count.dart';

class RequestCardActions extends StatelessWidget {
  final RequestEntity entity;
  final RequestStatusType statusType;

  const RequestCardActions({
    super.key,
    required this.entity,
    required this.statusType,
  });

  @override
  Widget build(BuildContext context) {
    final isOpen = isOpenStatus(statusType);
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Column(
          spacing: 5,
          crossAxisAlignment: .start,
          children: [
            SliderAndProgressCount(
              total: entity.bagsCnt!,
              collected: entity.collectedBags!,
            ),
            Row(
              spacing: 5,
              children: [
                RequestDeadline(deadline: entity.deadline!),
                SeeMoreButton(entity: entity),
              ],
            ),
          ],
        ),
        BlocProvider(
          create: (context) =>
              DonationCubit(DonationRepoImpl(dio: getIt.get<DioConsumer>())),
          child: BlocConsumer<DonationCubit, DonationStates>(
            listener: (context, donationState) {
              if (donationState is FailureDonation) {
                showAwesomeDialog(
                  context,
                  S.of(context).errorTitle,
                  donationState.errMsg,
                  false,
                  () {},
                );
              } else if (donationState is SuccessDonation) {
                final phoneLine =
                    (donationState.phoneNumber != null &&
                        donationState.phoneNumber!.isNotEmpty)
                    ? '\n${S.of(context).phoneNumberLabel}: ${donationState.phoneNumber}'
                    : '';
                showAwesomeDialog(
                  context,
                  S.of(context).successTitle,
                  '${S.of(context).donationSuccessMessage}$phoneLine',
                  true,
                  () {},
                );
              }
            },
            builder: (context, donationState) {
              final isLoading = donationState is LoadingDonation;
              final canDonate = isOpen && !isLoading && entity.id != null;
              return CustomButton(
                onPressed: canDonate
                    ? () =>
                          context.read<DonationCubit>().donateTo(id: entity.id!)
                    : null,
                label: S.of(context).donateNow,
              );
            },
          ),
        ),
      ],
    );
  }
}
