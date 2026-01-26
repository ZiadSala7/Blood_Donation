import 'package:flutter/material.dart';

import '../../../../../../core/utils/validators.dart';
import '../../../../../../core/widgets/custom_password_text_field.dart';
import '../../../../../../generated/l10n.dart';
import '../../cubit/register_cubit.dart';

class PasswordSection extends StatelessWidget {
  final RegisterCubit registerCubit;

  const PasswordSection({super.key, required this.registerCubit});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomPasswordField(
          controller: registerCubit.pass,
          label: S.of(context).password,
          hint: S.of(context).entrPassw,
          validator: passwordValidator,
        ),
        const SizedBox(height: 16),
        CustomPasswordField(
          controller: registerCubit.confirmPass,
          label: S.of(context).confirmPass,
          hint: S.of(context).entrPassw,
          validator: passwordValidator,
        ),
      ],
    );
  }
}
