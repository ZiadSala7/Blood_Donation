import 'package:flutter/material.dart';

import '../../../../../../core/managers/location_cubit/cubit/location_cubit.dart';
import '../../../../../../core/widgets/custom_drop_down.dart';
import '../../../../../../generated/l10n.dart';

class LocationSection extends StatelessWidget {
  final LocationCubit locCubit;
  final String? selectedGovernorate;
  final String? selectedCity;
  final ValueChanged<String?> onGovernorateChanged;
  final ValueChanged<String?> onCityChanged;

  const LocationSection({
    super.key,
    required this.locCubit,
    required this.selectedGovernorate,
    required this.selectedCity,
    required this.onGovernorateChanged,
    required this.onCityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomDropdown(
            label: S.of(context).city,
            hint: S.of(context).city,
            value: selectedGovernorate,
            items: locCubit.cities,
            onChanged: onGovernorateChanged,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: CustomDropdown(
            label: S.of(context).town,
            hint: S.of(context).town,
            value: selectedCity,
            items: locCubit.towns,
            onChanged: onCityChanged,
          ),
        ),
      ],
    );
  }
}
