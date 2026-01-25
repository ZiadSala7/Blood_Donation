// ============ CUSTOM TEXT FIELD WIDGET ============
import 'package:blood_donation/core/utils/app_colors.dart';
import 'package:blood_donation/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/build_border.dart';

class CustomHomeTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Function(String)? onChange;

  const CustomHomeTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.keyboardType,
    this.validator,
    required this.onChange,
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
            onChanged: onChange,
            controller: controller,
            keyboardType: keyboardType,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: AppColors.grey2, fontSize: 16),
              filled: true,
              fillColor: Colors.grey[50],
              prefixIcon: const Icon(Icons.search, color: AppColors.grey2),
              border: buildBorder(AppColors.greyBorder!, 0, radius: 20),
              enabledBorder: buildBorder(AppColors.greyBorder!, 0, radius: 20),
              focusedBorder: buildBorder(AppColors.commonClr, 2, radius: 20),
              errorBorder: buildBorder(Colors.red, 1.5, radius: 20),
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
