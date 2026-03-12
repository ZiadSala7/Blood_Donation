import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

class PaginationBar extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final ValueChanged<int> onPageSelected;

  const PaginationBar({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (totalPages <= 1) return const SizedBox.shrink();
    final pages = _visiblePages(currentPage, totalPages);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _NavButton(
            label: 'السابق',
            enabled: currentPage > 1,
            onTap: () => onPageSelected(currentPage - 1),
          ),
          const SizedBox(width: 8),
          for (final p in pages) ...[
            _PageChip(
              number: p,
              isActive: p == currentPage,
              onTap: () => onPageSelected(p),
            ),
            const SizedBox(width: 8),
          ],
          _NavButton(
            label: 'التالي',
            enabled: currentPage < totalPages,
            onTap: () => onPageSelected(currentPage + 1),
          ),
        ],
      ),
    );
  }

  List<int> _visiblePages(int current, int total) {
    if (total <= 3) return List<int>.generate(total, (i) => i + 1);
    if (current == 1) return [1, 2, 3];
    if (current == total) return [total - 2, total - 1, total];
    return [current - 1, current, current + 1];
  }
}

class _PageChip extends StatelessWidget {
  final int number;
  final bool isActive;
  final VoidCallback onTap;

  const _PageChip({
    required this.number,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bg = isActive ? AppColors.commonClr : AppColors.white;
    final fg = isActive ? AppColors.white : AppColors.text;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFFE6E6E6)),
          boxShadow: isActive
              ? const [
                  BoxShadow(
                    blurRadius: 10,
                    color: Color(0x22000000),
                    offset: Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Text(
          number.toString(),
          style: AppTextStyles.b16(context).copyWith(color: fg),
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final String label;
  final bool enabled;
  final VoidCallback onTap;

  const _NavButton({
    required this.label,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const bg = AppColors.white;
    final fg = enabled ? AppColors.text : AppColors.grey;
    return InkWell(
      onTap: enabled ? onTap : null,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE6E6E6)),
        ),
        child: Text(
          label,
          style: AppTextStyles.s14(context).copyWith(color: fg),
        ),
      ),
    );
  }
}
