import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../../../generated/l10n.dart';

class PersonalDataSaveButton extends StatelessWidget {
  final bool isSaving;
  final VoidCallback? onPressed;

  const PersonalDataSaveButton({
    super.key,
    required this.isSaving,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: isSaving ? null : onPressed,
      label: S.of(context).saveChanges,
      height: 56,
    );
  }
}
