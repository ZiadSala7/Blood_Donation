import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_text_styles.dart';
import '../../../../../../generated/l10n.dart';
import '../../cubit/login_cubit.dart';

class RememberMeCheckBox extends StatefulWidget {
  const RememberMeCheckBox({super.key});

  @override
  State<RememberMeCheckBox> createState() => _RememberMeCheckBoxState();
}

class _RememberMeCheckBoxState extends State<RememberMeCheckBox> {
  @override
  Widget build(BuildContext context) {
    final loginCubit = context.watch<LoginCubit>();
    return Row(
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              loginCubit.rememberMe = !loginCubit.rememberMe;
            });
          },
          icon: Icon(
            loginCubit.rememberMe
                ? Icons.check_box
                : Icons.check_box_outline_blank,
            color: loginCubit.rememberMe
                ? AppColors.commonClr
                : AppColors.greyBorder,
          ),
        ),
        Text(
          S.of(context).rememberMe,
          style: AppTextStyles.s18(context).copyWith(color: AppColors.grey),
        ),
      ],
    );
  }
}
