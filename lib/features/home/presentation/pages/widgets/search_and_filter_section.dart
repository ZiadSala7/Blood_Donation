import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../generated/l10n.dart';
import 'custom_home_text_field.dart';
import 'filtration_bottom_sheet.dart';

class SearchAndFilterSection extends StatelessWidget {
  final TextEditingController searchController;
  final ValueChanged<String> onSearchChanged;
  final ValueChanged<String> onSearchSubmitted;
  final Future<void> Function(
    bool suitableRequests,
    int sortingOption,
    int? governorateId,
    int? cityId,
  )
  onApplyFiltration;

  const SearchAndFilterSection({
    super.key,
    required this.searchController,
    required this.onSearchChanged,
    required this.onSearchSubmitted,
    required this.onApplyFiltration,
  });

  @override
  Widget build(BuildContext context) {
    const double fieldHeight = 51;
    return SizedBox(
      height: 80,
      child: Row(
        crossAxisAlignment: .end,
        mainAxisAlignment: .end,
        spacing: 10,
        children: [
          const SizedBox(),
          Expanded(
            flex: 5,
            child: SizedBox(
              height: 75,
              child: CustomHomeTextField(
                controller: searchController,
                label: '',
                hint: S.of(context).hosName,
                onChange: onSearchChanged,
                onSubmit: onSearchSubmitted,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (_) => FilterBottomSheet(onApply: onApplyFiltration),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              height: fieldHeight,
              decoration: BoxDecoration(
                color: AppColors.commonClr,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(Symbols.tune_rounded, color: AppColors.white),
            ),
          ),
          const SizedBox(),
        ],
      ),
    );
  }
}
