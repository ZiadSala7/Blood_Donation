import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_drop_down.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import 'create_donation_request_divider.dart';
import 'custom_date_time_picker.dart';
import 'donors_counter.dart';

class AddRequestViewBody extends StatelessWidget {
  const AddRequestViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        /// Divider
        const SliverAppBar(
          pinned: true,
          floating: false,
          toolbarHeight: 50,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
        ),
        const SliverAppBar(
          pinned: true,
          floating: false,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          toolbarHeight: 50,
          title: CreateDonationRequestDivider(),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                /// Custom TextFields
                CustomTextField(
                  hintClr: AppColors.hintClr,
                  maxLines: 2,
                  controller: TextEditingController(),
                  label: 'معلومات الحالة ',
                  hint: 'اسم الحالة\nمثال: طارئة - حادث سير',
                ),
                CustomTextField(
                  hintClr: AppColors.hintClr,
                  maxLines: 2,
                  controller: TextEditingController(),
                  label: '',
                  hint: 'وصف الحالة\nاكتب تفاصيل الحالة الطبية...',
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  hintClr: AppColors.hintClr,
                  controller: TextEditingController(),
                  label: 'معلومات المكان ',
                  hint: "اسم المستشفى",
                ),
                CustomDropdown(
                  hintClr: AppColors.hintClr,
                  label: '',
                  hint: 'اختر المدينة ',
                  value: "value",
                  items: [],
                  onChanged: (value) {},
                ),
                const SizedBox(height: 20),
                CustomDropdown(
                  hintClr: AppColors.hintClr,
                  label: "معلومات التبرع ",
                  hint: "نوع التبرع ",
                  value: "value",
                  items: [],
                  onChanged: (value) {},
                ),
                CustomDropdown(
                  hintClr: AppColors.hintClr,
                  label: "",
                  hint: "فصيلة الدم",
                  value: "value",
                  items: [],
                  onChanged: (value) {},
                ),
                const SizedBox(height: 16),
                const DonorsCounter(),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: CustomDateTimePicker(onDateSelected: (date) {}),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: CustomTextField(
                    hintClr: AppColors.hintClr,
                    maxLines: 1,
                    controller: TextEditingController(),
                    label: "رقم الهاتف",
                    hint: "01xxxxxxxxx",
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
