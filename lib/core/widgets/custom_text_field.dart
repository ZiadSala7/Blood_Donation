// ============ CUSTOM TEXT FIELD WIDGET ============
import 'package:flutter/material.dart';

import 'build_border.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final int maxLines;
  final Color? hintClr;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.keyboardType,
    this.validator,
    this.maxLines = 1,
    this.hintClr,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.b18(context)),
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
            maxLines: maxLines,
            controller: controller,
            keyboardType: keyboardType,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                color: hintClr ?? AppColors.greyBorder,
                fontSize: 14,
              ),
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
