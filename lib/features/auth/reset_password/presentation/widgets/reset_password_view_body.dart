import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/validators.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_password_text_field.dart';
import '../../../../../generated/l10n.dart';
import '../cubit/reset_password_cubit.dart';

class ResetPasswordViewBody extends StatelessWidget {
  final String resetToken;
  final String email;
  const ResetPasswordViewBody({
    super.key,
    required this.resetToken,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ResetPasswordCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Form(
        key: cubit.formKey,
        child: ListView(
          children: [
            const SizedBox(height: 150),
            Text(
              S.of(context).resetPass,
              style: AppTextStyles.b32(context),
              textAlign: .center,
            ),
            const SizedBox(height: 16),
            Text(
              S.of(context).enterNewPass,
              style: AppTextStyles.r20(context),
              textAlign: .center,
            ),
            const SizedBox(height: 48),
            CustomPasswordField(
              controller: cubit.newPassword,
              label: S.of(context).newPass,
              hint: S.of(context).entrPassw,
              validator: passwordValidator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            const SizedBox(height: 16),
            CustomPasswordField(
              controller: cubit.confirmNewPassword,
              label: S.of(context).confirmNewPass,
              hint: S.of(context).entrPassw,
              validator: (value) =>
                  confirmPasswordValidator(value, cubit.newPassword.text),
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            const SizedBox(height: 200),
            Column(
              crossAxisAlignment: .stretch,
              children: [
                CustomButton(
                  onPressed: () async {
                    if (cubit.formKey.currentState!.validate()) {
                      await cubit.resetPassword(
                        resetToken: resetToken,
                        email: email,
                      );
                    }
                  },
                  label: S.of(context).savePass,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
