import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_drop_down.dart';

class FiltrationLocationSection extends StatelessWidget {
  const FiltrationLocationSection({
    super.key,
    required this.selectedGovernorate,
    required this.selectedTown,
    required this.cities,
    required this.towns,
    required this.isTownsLoading,
    required this.onGovernorateChanged,
    required this.onTownChanged,
  });

  final String? selectedGovernorate;
  final String? selectedTown;
  final List<String> cities;
  final List<String> towns;
  final bool isTownsLoading;
  final ValueChanged<String?> onGovernorateChanged;
  final ValueChanged<String?> onTownChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('الموقع الجغرافي', style: AppTextStyles.r18(context)),
        const SizedBox(height: 20),
        CustomDropdown(
          isFiltration: true,
          hintClr: AppColors.hintClr,
          label: 'المحافظة',
          hint: 'اختر المحافظة',
          value: selectedGovernorate,
          items: cities,
          onChanged: onGovernorateChanged,
        ),
        const SizedBox(height: 16),
        CustomDropdown(
          isFiltration: true,
          hintClr: AppColors.hintClr,
          label: "المدينة / المركز",
          hint: isTownsLoading ? 'جاري التحميل...' : 'اختر المدينة',
          value: selectedTown,
          items: towns,
          onChanged: onTownChanged,
        ),
      ],
    );
  }
}
