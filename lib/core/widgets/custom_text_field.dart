// ============ CUSTOM TEXT FIELD WIDGET ============
import 'package:blood_donation/core/utils/app_colors.dart';
import 'package:blood_donation/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'build_border.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.b20(context)),
        const SizedBox(height: 8),
        Container(
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
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: AppColors.greyBorder, fontSize: 14),
              filled: true,
              fillColor: Colors.grey[50],
              border: buildBorder(AppColors.greyBorder!, 0),
              enabledBorder: buildBorder(AppColors.greyBorder!, 0),
              focusedBorder: buildBorder(AppColors.commonClr, 2),
              errorBorder: buildBorder(Colors.red, 1.5),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
            ),
            validator: validator,
          ),
        ),
      ],
    );
  }
}
