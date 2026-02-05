import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class CustomDateTimePicker extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  const CustomDateTimePicker({super.key, required this.onDateSelected});

  @override
  State<CustomDateTimePicker> createState() => _CustomDateTimePickerState();
}

class _CustomDateTimePickerState extends State<CustomDateTimePicker> {
  DateTime? selectedDate;

  Future<void> pickDate(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2035),
      builder: (context, child) {
        return Directionality(textDirection: TextDirection.rtl, child: child!);
      },
    );

    if (date != null) {
      setState(() => selectedDate = date);
      widget.onDateSelected(date);
    }
  }

  String get formattedDate {
    if (selectedDate == null) return 'اختر التاريخ';
    setState(() {});
    return '${selectedDate!.day} / ${selectedDate!.month} / ${selectedDate!.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('آخر موعد للتبرع', style: AppTextStyles.b20(context)),
        const SizedBox(height: 8),
        InkWell(
          onTap: () => pickDate(context),
          borderRadius: BorderRadius.circular(30),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.greyBorder!, width: 0),
            ),
            child: Center(
              child: Text(
                formattedDate,
                style: TextStyle(
                  color: formattedDate == 'اختر التاريخ'
                      ? AppColors.greyBorder
                      : Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
