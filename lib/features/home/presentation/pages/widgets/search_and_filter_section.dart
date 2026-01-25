import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../generated/l10n.dart';
import 'custom_home_text_field.dart';

class SearchAndFilterSection extends StatelessWidget {
  const SearchAndFilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        crossAxisAlignment: .center,
        mainAxisAlignment: .start,
        spacing: 20,
        children: [
          Expanded(
            flex: 5,
            child: CustomHomeTextField(
              controller: TextEditingController(),
              label: '',
              hint: S.of(context).hosName,
              onChange: (String value) {},
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.commonClr,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(Symbols.tune_rounded, color: AppColors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
