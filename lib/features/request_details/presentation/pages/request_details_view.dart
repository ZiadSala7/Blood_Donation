import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/api/dio_consumer.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/services/signalr/signalr_service.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/request_status_utils.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/show_awesome_dialog.dart';
import '../../../../generated/l10n.dart';
import '../../../home/data/models/request_model.dart';
import '../../data/repo/donation_repo_impl.dart';
import '../cubit/donation_cubit.dart';
import '../cubit/donation_states.dart';
import '../widgets/case_details_card.dart';
import '../widgets/header_card.dart';
import '../widgets/progress_card.dart';
import '../widgets/requester_card.dart';
import '../widgets/stats_card.dart';

class RequestDetailsView extends StatefulWidget {
  final RequestModel request;

  const RequestDetailsView({super.key, required this.request});

  @override
  State<RequestDetailsView> createState() => _RequestDetailsViewState();
}

class _RequestDetailsViewState extends State<RequestDetailsView> {
  late SignalRService signalR;
  Timer? _refreshTimer;
  late final DonationCubit _donationCubit;

  RequestStatusType _displayStatusType(RequestModel request) {
    return resolveRequestStatus(
      deadline: request.deadline,
      total: request.bagsCount ?? 1,
      collected: request.collectedBags ?? 0,
      status: request.status,
    );
  }

  @override
  void initState() {
    super.initState();

    signalR = SignalRService();
    _donationCubit = DonationCubit(
      DonationRepoImpl(dio: getIt.get<DioConsumer>()),
    );

    signalR.joinRequest(widget.request.id!);

    signalR.listenToRequestUpdates((id, data) {
      if (id == widget.request.id) {
        setState(() {
          // حدث البيانات هنا
        });
      }
    });

    _refreshTimer = Timer.periodic(const Duration(minutes: 1), (_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _refreshTimer?.cancel();
    signalR.leaveRequest(widget.request.id!);
    signalR.stopListening();
    _donationCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _donationCubit,
      child: BlocConsumer<DonationCubit, DonationStates>(
        listener: (context, state) {
          if (state is FailureDonation) {
            showAwesomeDialog(
              context,
              S.of(context).errorTitle,
              state.errMsg,
              false,
              () {},
            );
          } else if (state is SuccessDonation) {
            final phoneLine = (state.phoneNumber != null &&
                    state.phoneNumber!.isNotEmpty)
                ? '\n${S.of(context).phoneNumberLabel}: ${state.phoneNumber}'
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
        builder: (context, state) {
          final isOpen = isOpenStatus(_displayStatusType(widget.request));
          final isLoading = state is LoadingDonation;
          return ModalProgressHUD(
            inAsyncCall: isLoading,
            child: Scaffold(
              backgroundColor: AppColors.white,
              appBar: AppBar(
                scrolledUnderElevation: 0,
                backgroundColor: AppColors.white,
                title: Text(S.of(context).requestDetailsTitle),
                centerTitle: true,
                actions: const [Icon(Icons.share), SizedBox(width: 12)],
              ),
              body: ListView(
                padding: const EdgeInsets.all(8),
                children: [
                  HeaderCard(widget.request),
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
                          StatsCard(widget.request),
                          ProgressCard(widget.request),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  CaseDetailsCard(widget.request),
                  const SizedBox(height: 12),
                  RequesterCard(widget.request),
                  const SizedBox(height: 12),
                  CustomButton(
                    onPressed: isOpen && !isLoading
                        ? () => context
                            .read<DonationCubit>()
                            .donateTo(id: widget.request.id!)
                        : null,
                    label: S.of(context).donateNow,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
