import 'package:blood_donation/core/utils/app_colors.dart';
import 'package:blood_donation/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomAuthNavButton extends StatelessWidget {
  final String title, subTitle;
  final Function() onPressed;
  const CustomAuthNavButton({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      children: [
        Text(title, style: const TextStyle(color: Colors.grey, fontSize: 15)),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: onPressed,
          child: Text(
            subTitle,
            style: AppTextStyles.b18(
              context,
            ).copyWith(color: AppColors.commonClr),
          ),
        ),
      ],
    );
  }
}
