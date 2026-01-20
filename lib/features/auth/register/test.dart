import 'package:flutter/material.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/utils/validators.dart';
import '../../../core/widgets/custom_auth_nav_button.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_drop_down.dart';
import '../../../core/widgets/custom_password_text_field.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../generated/l10n.dart';
import 'presentation/views/widgets/build_header.dart';

// ============ MAIN SIGNUP VIEW ============
class BloodDonationSignupView extends StatefulWidget {
  const BloodDonationSignupView({super.key});

  @override
  State<BloodDonationSignupView> createState() =>
      _BloodDonationSignupViewState();
}

class _BloodDonationSignupViewState extends State<BloodDonationSignupView> {
  final _formKey = GlobalKey<FormState>();

  String? selectedAge;
  String? selectedBloodType;
  String? selectedGender;
  String? selectedCity;
  String? selectedGovernorate;

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  final List<String> genders = ['ذكر', 'أنثى'];
  final List<String> governorates = [
    'القاهرة',
    'الجيزة',
    'الإسكندرية',
    'أسيوط',
    'سوهاج',
  ];
  final List<String> cities = ['مدينة نصر', 'المعادي', 'الهرم', 'وسط البلد'];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            /// HEADER WITH LOGO
            buildHeader(),

            /// FORM SECTION
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),

                      // الاسم الكامل
                      CustomTextField(
                        controller: TextEditingController(),
                        label: S.of(context).fullName,
                        hint: S.of(context).entrFullName,
                        validator: nameValidator,
                      ),
                      const SizedBox(height: 16),

                      // البريد الإلكتروني
                      CustomTextField(
                        controller: TextEditingController(),
                        label: S.of(context).email,
                        hint: S.of(context).entrEmail,
                        keyboardType: TextInputType.emailAddress,
                        validator: emailValidator,
                      ),
                      const SizedBox(height: 16),

                      // رقم الهاتف
                      CustomTextField(
                        controller: TextEditingController(),
                        label: S.of(context).phoneNum,
                        hint: S.of(context).entrPhoneNum,
                        keyboardType: TextInputType.phone,
                        validator: emailValidator,
                      ),
                      const SizedBox(height: 16),

                      // DROPDOWNS ROW (العمر - النوع - فصيلة الدم)
                      Row(
                        children: [
                          Expanded(
                            child: CustomDropdown(
                              label: S.of(context).age,
                              hint: S.of(context).age,
                              value: selectedAge,
                              items: AppConstants.ages,
                              onChanged: (value) {
                                setState(() => selectedAge = value);
                              },
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: CustomDropdown(
                              label: S.of(context).gender,
                              hint: S.of(context).gender,
                              value: selectedGender,
                              items: genders,
                              onChanged: (value) {
                                setState(() => selectedGender = value);
                              },
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: CustomDropdown(
                              label: S.of(context).bloodType,
                              hint: S.of(context).bloodType,
                              value: selectedBloodType,
                              items: AppConstants.bloodTypes,
                              onChanged: (value) {
                                setState(() => selectedBloodType = value);
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // LOCATION ROW (المحافظة - المدينة)
                      Row(
                        children: [
                          Expanded(
                            child: CustomDropdown(
                              label: S.of(context).city,
                              hint: S.of(context).city,
                              value: selectedGovernorate,
                              items: governorates,
                              onChanged: (value) {
                                setState(() => selectedGovernorate = value);
                              },
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: CustomDropdown(
                              label: S.of(context).town,
                              hint: S.of(context).town,
                              value: selectedCity,
                              items: cities,
                              onChanged: (value) {
                                setState(() => selectedCity = value);
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // كلمة السر
                      CustomPasswordField(
                        controller: TextEditingController(),
                        label: S.of(context).password,
                        hint: S.of(context).entrPassw,
                        isVisible: _isPasswordVisible,
                        onToggleVisibility: () {
                          setState(
                            () => _isPasswordVisible = !_isPasswordVisible,
                          );
                        },
                        validator: passwordValidator,
                      ),
                      const SizedBox(height: 16),

                      // تأكيد كلمة السر
                      CustomPasswordField(
                        controller: TextEditingController(),
                        label: S.of(context).confirmPass,
                        hint: S.of(context).entrPassw,
                        isVisible: _isConfirmPasswordVisible,
                        onToggleVisibility: () {
                          setState(
                            () => _isConfirmPasswordVisible =
                                !_isConfirmPasswordVisible,
                          );
                        },
                        validator: passwordValidator,
                      ),
                      const SizedBox(height: 30),

                      // إنشاء حساب BUTTON
                      CustomButton(
                        onPressed: () {},
                        label: S.of(context).createAcc,
                      ),
                      const SizedBox(height: 20),

                      // هل لديك حساب بالفعل؟
                      const CustomAuthNavButton(),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
