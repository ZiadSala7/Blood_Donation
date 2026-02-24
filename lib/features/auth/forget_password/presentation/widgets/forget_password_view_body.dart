import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/validators.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../generated/l10n.dart';
import '../cubit/forget_cubit.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ForgetCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Form(
        key: cubit.formKey,
        child: ListView(
          children: [
            const SizedBox(height: 150),
            Text(
              S.of(context).areForgPass,
              style: AppTextStyles.b32(context),
              textAlign: .center,
            ),
            const SizedBox(height: 16),
            Text(
              S.of(context).forgPassValidate,
              style: AppTextStyles.r20(context),
              textAlign: .center,
            ),
            const SizedBox(height: 48),
            CustomTextField(
              controller: cubit.forgetPassEmail,
              label: S.of(context).email,
              hint: S.of(context).entrEmail,
              keyboardType: TextInputType.emailAddress,
              validator: emailValidator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            const SizedBox(height: 200),
            Column(
              crossAxisAlignment: .stretch,
              children: [
                CustomButton(
                  onPressed: () async {
                    if (cubit.formKey.currentState!.validate()) {
                      await cubit.verifyEmailToChangePass(
                        cubit.forgetPassEmail.text,
                      );
                    }
                  },
                  label: S.of(context).sendOtp,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
