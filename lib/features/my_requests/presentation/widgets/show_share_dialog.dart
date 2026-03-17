import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

Future<void> showShareDialog(BuildContext context, int requestId) async {
  final link = 'https://elixir.runasp.net/request/$requestId';
  Uri.parse(link);
  await showDialog<void>(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        title: Text('مشاركة الطلب', style: AppTextStyles.b18(dialogContext)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'استخدم الرابط التالي لمشاركة الطلب:',
              style: AppTextStyles.r14(
                dialogContext,
              ).copyWith(color: AppColors.grey),
            ),
            const SizedBox(height: 12),
            SelectableText(
              link,
              style: AppTextStyles.r16(dialogContext).copyWith(
                color: const Color.fromARGB(255, 22, 94, 153),
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text('إغلاق', style: AppTextStyles.r16(dialogContext)),
          ),
          FilledButton(
            onPressed: () async {
              await Clipboard.setData(ClipboardData(text: link));
              if (dialogContext.mounted) {
                Navigator.of(dialogContext).pop();
              }
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('تم النسخ الى الحافظة')),
                );
              }
            },
            style: TextButton.styleFrom(backgroundColor: AppColors.commonClr),
            child: Text(
              'نسخ الرابط',
              style: AppTextStyles.r16(
                dialogContext,
              ).copyWith(color: AppColors.white),
            ),
          ),
        ],
      );
    },
  );
}
