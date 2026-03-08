import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class FiltrationMedicalOnlySwitch extends StatelessWidget {
  const FiltrationMedicalOnlySwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'فصيلتي فقط',
                  textAlign: TextAlign.right,
                  style: AppTextStyles.b18(context),
                ),
                const SizedBox(height: 4),
                Text(
                  'عرض الطلبات المطابقة لفصيلتي (+A)',
                  textAlign: TextAlign.right,
                  style: AppTextStyles.r14(
                    context,
                  ).copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),

          const SizedBox(width: 16),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: Colors.white,
            activeTrackColor: AppColors.commonClr,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}
