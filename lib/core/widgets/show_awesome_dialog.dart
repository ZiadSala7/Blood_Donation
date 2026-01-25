import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

Future<dynamic> showAwesomeDialog(
  BuildContext context,
  String title,
  String desc,
  bool isSuccess,
  Function() btnOkOnPress,
) {
  return AwesomeDialog(
    context: context,
    dialogType: isSuccess ? DialogType.success : DialogType.error,
    animType: AnimType.bottomSlide,
    title: title,
    titleTextStyle: AppTextStyles.b20(context),
    descTextStyle: AppTextStyles.s16(context),
    desc: desc,
    btnOkColor: isSuccess ? const Color(0xff00ca72) : Colors.red,
    btnOkOnPress: btnOkOnPress,
  ).show();
}
