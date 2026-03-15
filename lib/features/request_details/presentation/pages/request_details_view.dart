import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/api/dio_consumer.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/services/signalr/signalr_service.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/request_status_utils.dart';
import '../../../../core/widgets/show_awesome_dialog.dart';
import '../../../../generated/l10n.dart';
import '../../../home/data/models/request_model.dart';
import '../../data/repo/donation_repo_impl.dart';
import '../cubit/donation_cubit.dart';
import '../cubit/donation_states.dart';
import '../widgets/request_details_appbar.dart';
import '../widgets/request_details_view_body.dart';

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
  late RequestModel _request;

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
    _request = widget.request;
    _donationCubit = DonationCubit(
      DonationRepoImpl(dio: getIt.get<DioConsumer>()),
    );

    signalR.joinRequest(widget.request.id!);

    signalR.listenToRequestUpdates((id, data) {
      if (id == widget.request.id) {
        _applyRequestUpdate(data);
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
            final phoneLine =
                (state.phoneNumber != null && state.phoneNumber!.isNotEmpty)
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
          final isOpen = isOpenStatus(_displayStatusType(_request));
          final isLoading = state is LoadingDonation;
          return ModalProgressHUD(
            inAsyncCall: isLoading,
            child: Scaffold(
              backgroundColor: AppColors.white,
              appBar: requestDetailsAppBar(context),
              body: RequestDetailsViewBody(
                request: _request,
                isOpen: isOpen,
                isLoading: isLoading,
              ),
            ),
          );
        },
      ),
    );
  }

  void _applyRequestUpdate(dynamic data) {
    final json = _extractRequestJson(data);
    if (json == null) return;
    setState(() {
      _request = RequestModel(
        id: _request.id,
        status: json['status']?.toString() ?? _request.status,
        patientName: json['patientName']?.toString() ?? _request.patientName,
        hospitalName: json['hospitalName']?.toString() ?? _request.hospitalName,
        description: json['description']?.toString() ?? _request.description,
        bagsCount: _intFrom(json['bagsCount']) ?? _request.bagsCount,
        responsesCount:
            _intFrom(json['responsesCount']) ?? _request.responsesCount,
        collectedBags:
            _intFrom(json['collectedBags']) ?? _request.collectedBags,
        phoneNumber: json['phoneNumber']?.toString() ?? _request.phoneNumber,
        latitude: _doubleFrom(json['latitude']) ?? _request.latitude,
        longitude: _doubleFrom(json['longitude']) ?? _request.longitude,
        createdAt: _parseDate(json['createdAt']) ?? _request.createdAt,
        requesterName:
            json['requesterName']?.toString() ?? _request.requesterName,
        donationCategoryAr: json['donationCategoryAr']?.toString() ??
            _request.donationCategoryAr,
        requiredBloodType: json['requiredBloodType']?.toString() ??
            _request.requiredBloodType,
        cityAr: json['cityAr']?.toString() ?? _request.cityAr,
        cityEn: json['cityEn']?.toString() ?? _request.cityEn,
        deadline: _parseDate(json['deadline']) ?? _request.deadline,
      );
    });
  }

  Map<String, dynamic>? _extractRequestJson(dynamic data) {
    if (data == null) return null;
    if (data is Map<String, dynamic>) {
      if (data['bloodRequestDTo'] is Map) {
        return Map<String, dynamic>.from(data['bloodRequestDTo'] as Map);
      }
      return data;
    }
    if (data is String) {
      try {
        final decoded = jsonDecode(data);
        if (decoded is Map<String, dynamic>) return decoded;
      } catch (_) {}
    }
    return null;
  }

  int? _intFrom(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is num) return value.toInt();
    return int.tryParse(value.toString());
  }

  double? _doubleFrom(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is num) return value.toDouble();
    return double.tryParse(value.toString());
  }

  DateTime? _parseDate(dynamic value) {
    if (value == null) return null;
    if (value is DateTime) return value;
    return DateTime.tryParse(value.toString());
  }
}
