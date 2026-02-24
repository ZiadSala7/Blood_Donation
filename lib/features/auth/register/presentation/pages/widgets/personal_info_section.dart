import 'package:flutter/material.dart';

import '../../../../../../core/utils/validators.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../../../../../../generated/l10n.dart';
import '../../cubit/register_cubit.dart';

class PersonalInfoSection extends StatelessWidget {
  final RegisterCubit registerCubit;

  const PersonalInfoSection({super.key, required this.registerCubit});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: registerCubit.name,
          label: S.of(context).fullName,
          hint: S.of(context).entrFullName,
          validator: nameValidator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: registerCubit.email,
          label: S.of(context).email,
          hint: S.of(context).entrEmail,
          keyboardType: TextInputType.emailAddress,
          validator: emailValidator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: registerCubit.phone,
          label: S.of(context).phoneNum,
          hint: S.of(context).entrPhoneNum,
          keyboardType: TextInputType.phone,
          validator: phoneValidator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ],
    );
  }
}
