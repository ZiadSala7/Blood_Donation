import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_constants.dart';
import '../../../../../../core/widgets/custom_drop_down.dart';
import '../../../../../../generated/l10n.dart';

class DropdownsSection extends StatelessWidget {
  final List<String> genders;
  final String? selectedAge;
  final String? selectedGender;
  final String? selectedBloodType;
  final ValueChanged<String?> onAgeChanged;
  final ValueChanged<String?> onGenderChanged;
  final ValueChanged<String?> onBloodChanged;

  const DropdownsSection({
    super.key,
    required this.genders,
    required this.selectedAge,
    required this.selectedGender,
    required this.selectedBloodType,
    required this.onAgeChanged,
    required this.onGenderChanged,
    required this.onBloodChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomDropdown(
            label: S.of(context).age,
            hint: S.of(context).age,
            value: selectedAge,
            items: AppConstants.ages,
            onChanged: (value) {
              onAgeChanged(value);
            },
          ),
        ),
        const SizedBox(width: 8),
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
        const SizedBox(width: 8),
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
