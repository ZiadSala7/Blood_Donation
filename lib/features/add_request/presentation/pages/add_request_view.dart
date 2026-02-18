import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/managers/location_cubit/cubit/location_cubit.dart';
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
    final locCubit = context.watch<LocationCubit>();
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
                cubit.selectedBloodType != null &&
                cubit.selectedBloodType!.isNotEmpty &&
                cubit.selectedDonCat != null &&
                cubit.selectedDonCat!.isNotEmpty &&
                cubit.selectedGovernorate != null &&
                cubit.selectedGovernorate!.isNotEmpty &&
                cubit.selectedTown != null &&
                cubit.selectedTown!.isNotEmpty &&
                cubit.deadline != null) {
              final matchingTowns = locCubit.townModels
                  .where((t) => t.nameAr == cubit.selectedTown)
                  .toList();
              if (matchingTowns.isNotEmpty) {
                await cubit.createRequest(cityId: matchingTowns.first.id!);
                cubit.clearData();
              }
            } else {
              showAwesomeDialog(
                context,
                "بيانات غير مكتملة",
                "من فضلك اكمل كل الحقول المطلوبة قبل إرسال الطلب.",
                false,
                () {},
              );
            }
          },
          label: S.of(context).addRqustBtn,
        ),
      ),
    );
  }
}
