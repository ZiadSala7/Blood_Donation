import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/validators.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_password_text_field.dart';
import '../../../../../generated/l10n.dart';
import '../cubit/change_password_cubit.dart';

class ChangePasswordViewBody extends StatelessWidget {
  const ChangePasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ChangePasswordCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Form(
        key: cubit.formKey,
        child: ListView(
          children: [
            const SizedBox(height: 150),
            Text(
              S.of(context).changePass,
              style: AppTextStyles.b32(context),
              textAlign: .center,
            ),
            const SizedBox(height: 16),
            Text(
              S.of(context).changePassDesc,
              style: AppTextStyles.r20(context),
              textAlign: .center,
            ),
            const SizedBox(height: 48),
            CustomPasswordField(
              controller: cubit.oldPassword,
              label: S.of(context).currentPass,
              hint: S.of(context).entrPassw,
              validator: passwordValidator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            const SizedBox(height: 16),
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
                      await cubit.changePass(
                        cubit.oldPassword.text,
                        cubit.newPassword.text,
                      );
                    }
                  },
                  label: S.of(context).saveChanges,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
