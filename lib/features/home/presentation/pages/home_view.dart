import 'package:blood_donation/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../generated/l10n.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: .end,
                crossAxisAlignment: .stretch,
                children: [
                  Text('👋أهلا: زياد', style: AppTextStyles.b24(context)),
                  const Text('       سوهاج : أخميم'),
                  SizedBox(
                    height: 100,
                    child: Row(
                      crossAxisAlignment: .center,
                      mainAxisAlignment: .center,
                      spacing: 20,
                      children: [
                        Expanded(
                          flex: 5,
                          child: CustomTextField(
                            controller: TextEditingController(),
                            label: '',
                            hint: S.of(context).hosName,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.commonClr,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Image.asset(AppAssets.assetsImagesSort),
                            ),
                          ),
                        ),
                      ],
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
