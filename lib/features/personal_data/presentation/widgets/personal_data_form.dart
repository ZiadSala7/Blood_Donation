import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/managers/location_cubit/cubit/location_cubit.dart';
import '../../../../core/managers/location_cubit/cubit/location_states.dart';
import '../../../../core/widgets/custom_drop_down.dart';
import '../../../../generated/l10n.dart';
import 'personal_data_text_field.dart';

class PersonalDataFormSection extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController bloodTypeController;
  final TextEditingController emailController;
  final String? selectedGovernorate;
  final String? selectedTown;
  final ValueChanged<String?> onGovernorateChanged;
  final ValueChanged<String?> onTownChanged;

  const PersonalDataFormSection({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.bloodTypeController,
    required this.emailController,
    required this.selectedGovernorate,
    required this.selectedTown,
    required this.onGovernorateChanged,
    required this.onTownChanged,
  });

  @override
  Widget build(BuildContext context) {
    final locCubit = context.watch<LocationCubit>();
    final isLoadingTowns = context.watch<LocationCubit>().state
        is LoadingLocState;

    return Column(
      children: [
        PersonalDataTextField(
          controller: nameController,
          label: S.of(context).fullName,
          hint: nameController.text,
          readOnly: true,
          suffixIcon: const Icon(Icons.person_outline, color: Colors.grey),
        ),
        const SizedBox(height: 14),
        PersonalDataTextField(
          controller: phoneController,
          label: S.of(context).phoneNum,
          hint: S.of(context).phoneNum,
          keyboardType: TextInputType.phone,
          suffixIcon: const Icon(Icons.phone, color: Colors.grey),
        ),
        const SizedBox(height: 14),
        PersonalDataTextField(
          controller: bloodTypeController,
          label: S.of(context).bloodType,
          hint: bloodTypeController.text,
          readOnly: true,
          suffixIcon: const Icon(Icons.water_drop_outlined, color: Colors.grey),
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            Expanded(
              child: CustomDropdown(
                label: S.of(context).governorateLabel,
                hint: S.of(context).governorateLabel,
                value: selectedGovernorate,
                items: locCubit.cities,
                onChanged: onGovernorateChanged,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CustomDropdown(
                label: S.of(context).town,
                hint: isLoadingTowns
                    ? S.of(context).loadingLabel
                    : S.of(context).town,
                value: selectedTown,
                items: locCubit.towns,
                onChanged: onTownChanged,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        PersonalDataTextField(
          controller: emailController,
          label: S.of(context).email,
          hint: emailController.text,
          readOnly: true,
          suffixIcon: const Icon(Icons.email_outlined, color: Colors.grey),
        ),
      ],
    );
  }
}
