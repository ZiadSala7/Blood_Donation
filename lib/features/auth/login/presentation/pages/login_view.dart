import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_auth_view.dart';
import '../../../../../core/widgets/show_awesome_dialog.dart';
import 'widgets/login_view_body_bloc_consumer.dart';

class LoginView extends StatefulWidget {
  final bool showResetSuccessDialog;
  final bool showRegisterSuccessDialog;

  const LoginView({
    super.key,
    this.showResetSuccessDialog = false,
    this.showRegisterSuccessDialog = false,
  });

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _dialogShown = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_dialogShown) return;

    if (widget.showRegisterSuccessDialog) {
      _dialogShown = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        showAwesomeDialog(
          context,
          "تم بنجاح",
          "تم إنشاء الحساب بنجاح",
          true,
          () {},
        );
      });
      return;
    }

    if (widget.showResetSuccessDialog) {
      _dialogShown = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        showAwesomeDialog(
          context,
          "تم بنجاح",
          "تمت إعادة تعيين كلمة المرور بنجاح",
          true,
          () {},
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.commonClr,
      body: SafeArea(
        child: CustomAuthView(widget: LoginViewBodyBlocConsumer()),
      ),
    );
  }
}
