import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../generated/l10n.dart';

class NextAndSkipButton extends StatelessWidget {
  const NextAndSkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: .spaceBetween,
          crossAxisAlignment: .center,
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: AppColors.commonClr,
                borderRadius: BorderRadius.circular(50),
              ),
              child: FittedBox(
                fit: BoxFit.fitHeight,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  iconSize: 20,
                ),
              ),
            ),
            Text(
              S.of(context).skip,
              style: AppTextStyles.b24(context).copyWith(color: AppColors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
