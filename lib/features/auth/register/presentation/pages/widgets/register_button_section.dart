import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_constants.dart';
import '../../../../../../core/managers/location_cubit/cubit/location_cubit.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../generated/l10n.dart';
import '../../cubit/register_cubit.dart';

class RegisterButtonSection extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final RegisterCubit registerCubit;
  final LocationCubit locCubit;
  final List<String> genders;
  final String? selectedAge;
  final String? selectedBloodType;
  final String? selectedGender;
  final String? selectedCity;

  const RegisterButtonSection({
    super.key,
    required this.formKey,
    required this.registerCubit,
    required this.locCubit,
    required this.genders,
    required this.selectedAge,
    required this.selectedBloodType,
    required this.selectedGender,
    required this.selectedCity,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      label: S.of(context).createAcc,
      onPressed: () async {
        if (formKey.currentState!.validate() &&
            registerCubit.pass.text == registerCubit.confirmPass.text) {
          await registerProcess();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('كلمة السر غير متطابقة')),
          );
        }
      },
    );
  }

  Future<void> registerProcess() async {
    await registerCubit.register(
      fullName: registerCubit.name.text,
      email: registerCubit.email.text,
      age: int.parse(selectedAge!),
      bloodTypeId: AppConstants.bloodTypes.indexOf(selectedBloodType!) + 1,
      gender: genders.indexOf(selectedGender!) + 1,
      cityId: locCubit.townModels
          .firstWhere((t) => t.nameAr == selectedCity)
          .id!,
      password: registerCubit.pass.text,
      phoneNum: registerCubit.phone.text,
    );
  }
}
