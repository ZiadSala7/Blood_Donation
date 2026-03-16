import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/request_status_utils.dart';
import '../../../../core/widgets/show_awesome_dialog.dart';
import '../../../../generated/l10n.dart';
import '../cubit/donation_cubit.dart';
import '../cubit/donation_states.dart';
import '../widgets/request_details_appbar.dart';
import '../widgets/request_details_view_body.dart';
import 'request_details_state.dart';

class RequestDetailsScaffold extends StatelessWidget {
  final RequestDetailsState state;

  const RequestDetailsScaffold({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: state.donationCubit,
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
          final isOpen = isOpenStatus(
            resolveRequestStatus(
              deadline: state.request.deadline,
              total: state.request.bagsCount ?? 1,
              collected: state.request.collectedBags ?? 0,
              status: state.request.status,
            ),
          );
          final isLoading = donationState is LoadingDonation;
          return ModalProgressHUD(
            inAsyncCall: isLoading,
            child: Scaffold(
              backgroundColor: AppColors.white,
              appBar: requestDetailsAppBar(context),
              body: RequestDetailsViewBody(
                request: state.request,
                isOpen: isOpen,
                isLoading: isLoading,
              ),
            ),
          );
        },
      ),
    );
  }
}
