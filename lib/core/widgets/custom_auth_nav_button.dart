import 'package:blood_donation/core/utils/app_colors.dart';
import 'package:blood_donation/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomAuthNavButton extends StatelessWidget {
  const CustomAuthNavButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            // Navigate to login
          },
          child: Text(
            'تسجيل الدخول من هنا',
            style: AppTextStyles.b18(
              context,
            ).copyWith(color: AppColors.commonClr),
          ),
        ),
        const SizedBox(width: 5),
        const Text(
          'هل لديك حساب بالفعل؟',
          style: TextStyle(color: Colors.grey, fontSize: 15),
        ),
      ],
    );
  }
}
