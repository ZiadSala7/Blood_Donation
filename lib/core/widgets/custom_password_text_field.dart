// ============ CUSTOM PASSWORD FIELD WIDGET ============
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import 'build_border.dart';

class CustomPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final bool isVisible;
  final VoidCallback onToggleVisibility;
  final String? Function(String?)? validator;

  const CustomPasswordField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.isVisible,
    required this.onToggleVisibility,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(label, style: AppTextStyles.b20(context)),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
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
      ],
    );
  }
}
