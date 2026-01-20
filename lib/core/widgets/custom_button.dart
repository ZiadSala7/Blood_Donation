import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;
  final String label;
  const CustomButton({super.key, required this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFB71C1C),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          label,
          style: AppTextStyles.b22(context).copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
