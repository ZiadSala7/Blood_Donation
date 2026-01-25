import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/constants/app_constants.dart';
import '../../../../../../core/managers/location_cubit/cubit/location_cubit.dart';
import '../../../../../../core/utils/validators.dart';
import '../../../../../../core/widgets/custom_auth_nav_button.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_drop_down.dart';
import '../../../../../../core/widgets/custom_password_text_field.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../../../../../../generated/l10n.dart';
import '../../cubit/register_cubit.dart';

// ============ MAIN SIGNUP VIEW ============
class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final _formKey = GlobalKey<FormState>();

  String? selectedAge;
  String? selectedBloodType;
  String? selectedGender;
  String? selectedCity;
  String? selectedGovernorate;

  final List<String> genders = ['ذكر', 'أنثى'];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var locCubit = context.watch<LocationCubit>();
    var registerCubit = context.watch<RegisterCubit>();
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 20),
            // الاسم الكامل
            CustomTextField(
              controller: registerCubit.name,
              label: S.of(context).fullName,
              hint: S.of(context).entrFullName,
              validator: nameValidator,
            ),
            const SizedBox(height: 16),

            // البريد الإلكتروني
            CustomTextField(
              controller: registerCubit.email,
              label: S.of(context).email,
              hint: S.of(context).entrEmail,
              keyboardType: TextInputType.emailAddress,
              validator: emailValidator,
            ),
            const SizedBox(height: 16),

            // رقم الهاتف
            CustomTextField(
              controller: registerCubit.phone,
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
                    items: locCubit.cities,
                    onChanged: (value) {
                      setState(() {
                        selectedGovernorate = value;
                        locCubit.getTowns(
                          locCubit.cities.indexOf(selectedGovernorate!) + 1,
                        );
                      });
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomDropdown(
                    label: S.of(context).town,
                    hint: S.of(context).town,
                    value: selectedCity,
                    items: locCubit.towns,
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
              controller: registerCubit.pass,
              label: S.of(context).password,
              hint: S.of(context).entrPassw,
              validator: passwordValidator,
            ),
            const SizedBox(height: 16),

            // تأكيد كلمة السر
            CustomPasswordField(
              controller: registerCubit.confirmPass,
              label: S.of(context).confirmPass,
              hint: S.of(context).entrPassw,
              validator: passwordValidator,
            ),
            const SizedBox(height: 30),

            // إنشاء حساب BUTTON
            CustomButton(
              onPressed: () async {
                if (_formKey.currentState!.validate() &&
                    registerCubit.pass.text == registerCubit.confirmPass.text) {
                  await registerCubit.register(
                    fullName: registerCubit.name.text,
                    email: registerCubit.email.text,
                    age: int.parse(selectedAge!),
                    bloodTypeId:
                        AppConstants.bloodTypes.indexOf(selectedBloodType!) + 1,
                    gender: genders.indexOf(selectedGender!) + 1,
                    cityId: locCubit.townModels
                        .firstWhere((t) => t.nameAr == selectedCity)
                        .id!,
                    password: registerCubit.pass.text,
                    phoneNum: registerCubit.phone.text,
                  );
                } else {}
              },
              label: S.of(context).createAcc,
            ),
            const SizedBox(height: 20),

            // هل لديك حساب بالفعل؟
            CustomAuthNavButton(
              title: S.of(context).haveAcc,
              subTitle: S.of(context).loginHere,
              onPressed: () {
                context.pushReplacementNamed('login');
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
