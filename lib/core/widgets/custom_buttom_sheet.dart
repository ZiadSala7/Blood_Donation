import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import 'custom_button.dart';
import '../../generated/l10n.dart';

class CustomBottomSheetBody extends StatelessWidget {
  const CustomBottomSheetBody({
    super.key,
    required this.message,
    this.onTapYes,
  });
  final String message;
  final Function()? onTapYes;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Center(
          child: Column(
            spacing: 16,
            children: <Widget>[
              Text(
                message,
                style: AppTextStyles.b20(context),
                textAlign: TextAlign.center,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: CustomButton(
                      label: S.of(context).yesLabel,
                      onPressed: onTapYes!,
                    ),
                  ),
                  const SizedBox(width: 100),
                  Expanded(
                    flex: 1,
                    child: CustomButton(
                      bkgrndClr: AppColors.greyBorder!,
                      label: S.of(context).noLabel,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
