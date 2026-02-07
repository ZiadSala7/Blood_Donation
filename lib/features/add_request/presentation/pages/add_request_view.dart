import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/widgets/show_awesome_dialog.dart';
import '../../../../generated/l10n.dart';
import '../../../../core/widgets/custom_button.dart';
import '../cubit/add_request_cubit.dart';
import '../cubit/add_request_states.dart';
import 'widgets/add_request_view_body.dart';

class AddRequestView extends StatelessWidget {
  const AddRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AddRequestCubit>();
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
                "عملية ناجحة",
                "نم انشاء طلبك بنجاح",
                true,
                () {},
              );
            } else if (state is FailureAddRequestState) {
              showAwesomeDialog(
                context,
                "فشلت العملية",
                state.errMsg,
                false,
                () {},
              );
            }
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: CustomButton(
          onPressed: () async {
            if (cubit.addRqstFormKey.currentState!.validate() &&
                cubit.selectedBloodType != "value" &&
                cubit.selectedDonCat != "value" &&
                cubit.selectedTown != "value" &&
                cubit.deadline != null) {
              await cubit.createRequest();
            }
          },
          label: S.of(context).addRqustBtn,
        ),
      ),
    );
  }
}
