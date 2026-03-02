import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_constants.dart';
import '../../../../../../core/widgets/custom_drop_down.dart';
import '../../../../../../generated/l10n.dart';

class DropdownsSection extends StatelessWidget {
  final List<String> genders;
  final String? selectedGender;
  final String? selectedBloodType;
  final ValueChanged<String?> onGenderChanged;
  final ValueChanged<String?> onBloodChanged;

  const DropdownsSection({
    super.key,
    required this.genders,
    required this.selectedGender,
    required this.selectedBloodType,
    required this.onGenderChanged,
    required this.onBloodChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomDropdown(
            label: S.of(context).gender,
            hint: S.of(context).gender,
            value: selectedGender,
            items: genders,
            onChanged: (value) {
              onGenderChanged(value);
            },
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: CustomDropdown(
            label: S.of(context).bloodType,
            hint: S.of(context).bloodType,
            value: selectedBloodType,
            items: AppConstants.bloodTypes,
            onChanged: (value) {
              onBloodChanged(value);
            },
          ),
        ),
      ],
    );
  }
}
