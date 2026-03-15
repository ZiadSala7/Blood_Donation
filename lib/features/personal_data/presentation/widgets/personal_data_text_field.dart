import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_text_field.dart';

class PersonalDataTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final TextInputType? keyboardType;
  final bool readOnly;
  final Widget? suffixIcon;

  const PersonalDataTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.keyboardType,
    this.readOnly = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        CustomTextField(
          controller: controller,
          label: label,
          hint: hint,
          keyboardType: keyboardType,
          readOnly: readOnly,
          widget: IgnorePointer(child: suffixIcon!),
        ),
      ],
    );
  }
}
