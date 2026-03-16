import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/managers/location_cubit/cubit/location_cubit.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/show_awesome_dialog.dart';
import '../../../../generated/l10n.dart';
import '../cubit/add_request_cubit.dart';
import 'request_body_text_fields.dart';
import 'sliver_appbar_with_divider.dart';
import 'sliver_appbar_with_leading.dart';

class AddRequestViewBody extends StatefulWidget {
  const AddRequestViewBody({super.key});

  @override
  State<AddRequestViewBody> createState() => _AddRequestViewBodyState();
}

class _AddRequestViewBodyState extends State<AddRequestViewBody> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LocationCubit>().getCities();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AddRequestCubit>();
    final locCubit = context.watch<LocationCubit>();
    return CustomScrollView(
      slivers: [
        /// Divider
        const SliverAppBarWithLeading(),
        const SliverAppBarWithDivider(),
        const SliverToBoxAdapter(child: SizedBox(height: 10)),

        /// Request Body TextFields
        const RequestBodyTextFields(),

        /// button to add request
        SliverToBoxAdapter(
          child: Padding(
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
                    S.of(context).incompleteDataTitle,
                    S.of(context).incompleteDataDesc,
                    false,
                    () {},
                  );
                }
              },
              label: S.of(context).addRqustBtn,
            ),
          ),
        ),
      ],
    );
  }
}
