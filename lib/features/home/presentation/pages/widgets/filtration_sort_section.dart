import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../generated/l10n.dart';

class FiltrationSortSection extends StatelessWidget {
  const FiltrationSortSection({
    super.key,
    required this.selectedSort,
    required this.onSortSelected,
  });

  final int selectedSort;
  final ValueChanged<int> onSortSelected;

  @override
  Widget build(BuildContext context) {
    final sortOptions = [
      (text: S.of(context).sortNewest, icon: Icons.access_time_sharp),
      (text: S.of(context).sortOldest, icon: Icons.history),
      (text: S.of(context).sortNearestDeadline, icon: Icons.event_available_outlined),
      (text: S.of(context).sortFarthestDeadline, icon: Icons.event_busy_outlined),
      (text: S.of(context).sortMostComplete, icon: Icons.trending_up),
      (text: S.of(context).sortLeastComplete, icon: Icons.trending_down),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).sortByLabel, style: AppTextStyles.s18(context)),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: List.generate(
            sortOptions.length,
            (index) => SortChip(
              text: sortOptions[index].text,
              icon: sortOptions[index].icon,
              selected: selectedSort == index,
              onTap: () => onSortSelected(index),
            ),
          ),
        ),
      ],
    );
  }
}

class SortChip extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const SortChip({
    super.key,
    required this.text,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFB3262E) : Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: selected ? Colors.transparent : Colors.grey.shade300,
            width: 1.5,
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 20,
              color: selected ? Colors.white : Colors.grey[700],
            ),
            const SizedBox(width: 8),
            Text(
              text,
              style: AppTextStyles.r16(context).copyWith(
                color: selected ? Colors.white : const Color(0xFF4B5563),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
