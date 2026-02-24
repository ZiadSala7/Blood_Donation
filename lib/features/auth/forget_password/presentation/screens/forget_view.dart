import 'package:blood_donation/core/utils/app_text_styles.dart';
import 'package:blood_donation/core/widgets/custom_button.dart';
import 'package:blood_donation/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/validators.dart';
import '../../../../../generated/l10n.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
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
              controller: TextEditingController(),
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
                CustomButton(onPressed: () {}, label: S.of(context).sendOtp),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
