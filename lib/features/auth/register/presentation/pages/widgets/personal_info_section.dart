import 'package:flutter/material.dart';

import '../../../../../../core/utils/validators.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../../../../../../generated/l10n.dart';
import '../../cubit/register_cubit.dart';

class PersonalInfoSection extends StatelessWidget {
  final RegisterCubit registerCubit;
  final DateTime? selectedDateOfBirth;
  final Future<void> Function() onSelectDateOfBirth;

  const PersonalInfoSection({
    super.key,
    required this.registerCubit,
    required this.selectedDateOfBirth,
    required this.onSelectDateOfBirth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: registerCubit.name,
          label: S.of(context).fullName,
          hint: S.of(context).entrFullName,
          validator: nameValidator,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: registerCubit.email,
          label: S.of(context).email,
          hint: S.of(context).entrEmail,
          keyboardType: TextInputType.emailAddress,
          validator: emailValidator,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: registerCubit.phone,
          label: S.of(context).phoneNum,
          hint: S.of(context).entrPhoneNum,
          keyboardType: TextInputType.phone,
          validator: phoneValidator,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: registerCubit.dateOfBirth,
          label: S.of(context).dateOfBirth,
          hint: S.of(context).selectDateOfBirth,
          readOnly: true,
          onTap: onSelectDateOfBirth,
          hintClr: selectedDateOfBirth == null ? null : Colors.black,
          validator: (value) {
            if (selectedDateOfBirth == null) {
              return S.of(context).dateOfBirthRequired;
            }
            return null;
          },
        ),
      ],
    );
  }
}
