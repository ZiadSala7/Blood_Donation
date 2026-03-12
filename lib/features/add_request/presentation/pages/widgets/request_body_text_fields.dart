import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/helper/lookup_api_functions.dart';
import '../../../../../core/managers/location_cubit/cubit/location_cubit.dart';
import '../../../../../core/managers/location_cubit/cubit/location_states.dart';
import '../../../../../core/utils/validators.dart';
import '../../../../../generated/l10n.dart';
import 'donors_counter.dart';
import 'custom_date_time_picker.dart';
import '../../cubit/add_request_cubit.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_drop_down.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class RequestBodyTextFields extends StatefulWidget {
  const RequestBodyTextFields({super.key});

  @override
  State<RequestBodyTextFields> createState() => _RequestBodyTextFieldsState();
}

class _RequestBodyTextFieldsState extends State<RequestBodyTextFields> {
  @override
  Widget build(BuildContext context) {
    List<String> donationCats = getAllCachedCats();
    final cubit = context.watch<AddRequestCubit>();
    final locCubit = context.watch<LocationCubit>();
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocListener<LocationCubit, LocationStates>(
          listenWhen: (previous, current) => current is SuccessTownLocState,
          listener: (context, state) {
            final loc = context.read<LocationCubit>();
            final addRequestCubit = context.read<AddRequestCubit>();
            if (loc.towns.isNotEmpty) {
              addRequestCubit.selectedTown = loc.towns.first;
            }
          },
          child: Form(
            key: cubit.addRqstFormKey,
            child: Column(
              children: [
                /// Custom TextFields
                CustomTextField(
                  hintClr: AppColors.hintClr,
                  maxLines: 2,
                  controller: cubit.patientName,
                  label: S.of(context).caseInfoLabel,
                  hint: S.of(context).caseNameHint,
                  validator: (context, value) =>
                      nameValidator(context, value),
                ),
                CustomTextField(
                  hintClr: AppColors.hintClr,
                  maxLines: 2,
                  controller: cubit.dscrptionName,
                  label: '',
                  hint: S.of(context).caseDescriptionHint,
                  validator: (context, value) =>
                      nameValidator(context, value),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  hintClr: AppColors.hintClr,
                  controller: cubit.hsptalName,
                  label: S.of(context).placeInfoLabel,
                  hint: S.of(context).hospitalNameHint,
                  validator: (context, value) =>
                      nameValidator(context, value),
                ),
                CustomDropdown(
                  hintClr: AppColors.hintClr,
                  label: '',
                  hint: S.of(context).selectGovernorate,
                  value: cubit.selectedGovernorate,
                  items: locCubit.cities,
                  onChanged: (value) {
                    setState(() {
                      cubit.selectedGovernorate = value;
                      cubit.selectedTown = null;
                      if (value != null && value.isNotEmpty) {
                        final idx = locCubit.cities.indexOf(value);
                        if (idx >= 0) {
                          locCubit.getTowns(idx + 1);
                        }
                      }
                    });
                  },
                ),
                CustomDropdown(
                  hintClr: AppColors.hintClr,
                  label: '',
                  hint:
                      locCubit.state is LoadingLocState &&
                          cubit.selectedGovernorate != null
                      ? S.of(context).loadingLabel
                      : S.of(context).selectCity,
                  value: cubit.selectedTown,
                  items: locCubit.towns,
                  onChanged: (value) {
                    setState(() {
                      cubit.selectedTown = value;
                    });
                  },
                ),
                const SizedBox(height: 20),
                CustomDropdown(
                  hintClr: AppColors.hintClr,
                  label: S.of(context).donationInfoLabel,
                  hint: S.of(context).donationTypeHint,
                  value: cubit.selectedDonCat,
                  items: donationCats,
                  onChanged: (value) {
                    setState(() {
                      cubit.selectedDonCat = value;
                    });
                  },
                ),
                CustomDropdown(
                  hintClr: AppColors.hintClr,
                  label: "",
                  hint: S.of(context).bloodTypeLabel,
                  value: cubit.selectedBloodType,
                  items: AppConstants.bloodTypes,
                  onChanged: (value) {
                    setState(() {
                      cubit.selectedBloodType = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                DonorsCounter(cubit: cubit),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: CustomDateTimePicker(
                    onDateSelected: (date) {
                      cubit.deadline = date;
                    },
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: CustomTextField(
                    hintClr: AppColors.hintClr,
                    maxLines: 1,
                    controller: cubit.phoneNum,
                    label: S.of(context).phoneNumberLabel,
                    hint: "01xxxxxxxxx",
                    validator: (context, value) =>
                        phoneValidator(context, value),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
