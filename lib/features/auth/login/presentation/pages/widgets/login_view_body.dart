import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/app_assets.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_auth_nav_button.dart';
import '../../../../../../core/utils/app_text_styles.dart';
import '../../../../../../core/utils/validators.dart';
import '../../../../../../core/widgets/custom_password_text_field.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../../../../../../generated/l10n.dart';
import '../../cubit/login_cubit.dart';
import 'remember_me_check_box.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _validateLive(String? _) {
    _formKey.currentState?.validate();
  }

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.watch<LoginCubit>();
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            /// FORM VALIDATION
            const SizedBox(height: 20),
            // Ø§Ù„Ø¨Ø±ÙŠØ¯ Ø§Ù„Ø¥Ù„ÙƒØªØ±ÙˆÙ†ÙŠ
            CustomTextField(
              controller: loginCubit.email,
              label: S.of(context).email,
              hint: S.of(context).entrEmail,
              keyboardType: TextInputType.emailAddress,
              validator: emailValidator,
              onChanged: _validateLive,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            const SizedBox(height: 16),
            // ÙƒÙ„Ù…Ø© Ø§Ù„Ø³Ø±
            CustomPasswordField(
              controller: loginCubit.password,
              label: S.of(context).password,
              hint: S.of(context).entrPassw,
              validator: passwordValidator,
              onChanged: _validateLive,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                const RememberMeCheckBox(),
                InkWell(
                  onTap: () {},
                  child: Text(
                    S.of(context).doYouforgetPass,
                    style: AppTextStyles.b18(context),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Column(
              crossAxisAlignment: .stretch,
              children: [
                CustomButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await loginCubit.loginWithEmail(
                        email: loginCubit.email.text,
                        password: loginCubit.password.text,
                      );
                    }
                  },
                  label: S.of(context).login,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.grey.withOpacity(0.20),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () async {
                  await context.read<LoginCubit>().signInWithGoogle();
                },
                child: Row(
                  spacing: 10,
                  mainAxisAlignment: .center,
                  children: [
                    Image.asset(AppAssets.assetsImagesGoogle),
                    Text(
                      S.of(context).loginWithGoogle,
                      style: AppTextStyles.b20(context),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 35),
            CustomAuthNavButton(
              title: S.of(context).dontHaveAcc,
              subTitle: S.of(context).createAcc,
              onPressed: () {
                context.pushReplacementNamed('register');
              },
            ),
          ],
        ),
      ),
    );
  }
}
