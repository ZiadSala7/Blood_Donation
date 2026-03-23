import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/services/signalr/request_update_utils.dart';
import '../../../../core/services/signalr/signalr_service.dart';
import '../../../../core/widgets/show_awesome_dialog.dart';
import '../../../../generated/l10n.dart';
import '../../../home/presentation/cubit/home_cubit.dart';
import '../cubit/add_request_cubit.dart';
import '../cubit/add_request_states.dart';
import '../widgets/add_request_view_body.dart';

class AddRequestView extends StatefulWidget {
  const AddRequestView({super.key});

  @override
  State<AddRequestView> createState() => _AddRequestViewState();
}

class _AddRequestViewState extends State<AddRequestView> {
  final SignalRService _signalR = SignalRService();
  void Function(int requestId, dynamic data)? _signalrListener;

  @override
  void initState() {
    super.initState();
    _initRealtime();
  }

  Future<void> _initRealtime() async {
    await _signalR.connect();
    _signalrListener = (requestId, data) {
      if (!mounted) return;
      final homeCubit = context.read<HomeCubit>();
      if (RequestUpdateUtils.hasMeaningfulChange(
        homeCubit.allEntities,
        requestId,
        data,
      )) {
        homeCubit.refreshRequests();
      }
    };
    _signalR.listenToRequestUpdates(_signalrListener!);
  }

  @override
  void dispose() {
    if (_signalrListener != null) {
      _signalR.removeListener(_signalrListener!);
      _signalrListener = null;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AddRequestCubit, AddRequestStates>(
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is LoadingAddRequestState ? true : false,
              child: const AddRequestViewBody(),
            );
          },
          listener: (context, state) {
            if (state is SuccessAddRequestState) {
              showAwesomeDialog(
                context,
                S.of(context).operationSuccessTitle,
                S.of(context).requestCreatedSuccessDesc,
                true,
                () {},
              );
            } else if (state is FailureAddRequestState) {
              showAwesomeDialog(
                context,
                S.of(context).operationFailedTitle,
                state.errMsg,
                false,
                () {},
              );
            }
          },
        ),
      ),
    );
  }
}
