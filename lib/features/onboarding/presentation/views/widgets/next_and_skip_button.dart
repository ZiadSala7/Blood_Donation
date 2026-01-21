import 'package:blood_donation/core/constants/app_constants.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../generated/l10n.dart';

class NextAndSkipButton extends StatelessWidget {
  final int index;
  const NextAndSkipButton({super.key, required this.index});

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
            InkWell(
              onTap: () {
                AppConstants.onbrdngPageCntroller.animateToPage(
                  3,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: Text(
                S.of(context).skip,
                style: AppTextStyles.b24(
                  context,
                ).copyWith(color: AppColors.grey),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: AppColors.commonClr,
                borderRadius: BorderRadius.circular(50),
              ),
              child: FittedBox(
                fit: BoxFit.fitHeight,
                child: IconButton(
                  onPressed: () {
                    AppConstants.onbrdngPageCntroller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  icon: const Icon(Icons.arrow_forward_ios),
                  color: Colors.white,
                  iconSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
