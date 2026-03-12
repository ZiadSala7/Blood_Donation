import 'package:flutter/material.dart';

import '../../../../../../core/managers/location_cubit/cubit/location_cubit.dart';
import '../../../../../../core/widgets/custom_drop_down.dart';
import '../../../../../../generated/l10n.dart';

class LocationSection extends StatelessWidget {
  final LocationCubit locCubit;
  final bool isLoadingTowns;
  final String? selectedGovernorate;
  final String? selectedTown;
  final ValueChanged<String?> onGovernorateChanged;
  final ValueChanged<String?> onTownChanged;

  const LocationSection({
    super.key,
    required this.locCubit,
    required this.isLoadingTowns,
    required this.selectedGovernorate,
    required this.selectedTown,
    required this.onGovernorateChanged,
    required this.onTownChanged,
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
            onChanged: (value) {
              onGovernorateChanged(value);
            },
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: CustomDropdown(
            label: S.of(context).town,
            hint: isLoadingTowns
                ? S.of(context).loadingLabel
                : S.of(context).town,
            value: selectedTown,
            items: locCubit.towns,
            onChanged: (value) {
              onTownChanged(value);
            },
          ),
        ),
      ],
    );
  }
}
