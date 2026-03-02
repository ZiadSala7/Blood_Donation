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
  final DateTime? selectedDateOfBirth;
  final String? selectedBloodType;
  final String? selectedGender;
  final String? selectedCity;

  const RegisterButtonSection({
    super.key,
    required this.formKey,
    required this.registerCubit,
    required this.locCubit,
    required this.genders,
    required this.selectedDateOfBirth,
    required this.selectedBloodType,
    required this.selectedGender,
    required this.selectedCity,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      label: S.of(context).createAcc,
      onPressed: () async {
        if (!formKey.currentState!.validate()) return;

        if (registerCubit.pass.text != registerCubit.confirmPass.text) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(S.of(context).passwordsDoNotMatch)),
          );
          return;
        }

        if (selectedDateOfBirth == null ||
            selectedBloodType == null ||
            selectedGender == null ||
            selectedCity == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(S.of(context).completeRequiredFields)),
          );
          return;
        }

        await registerProcess(context);
      },
    );
  }

  Future<void> registerProcess(BuildContext context) async {
    final selectedTownIndex = locCubit.townModels.indexWhere(
      (town) => town.nameAr == selectedCity,
    );
    if (selectedTownIndex == -1) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(S.of(context).selectValidCity)),
      );
      return;
    }

    await registerCubit.register(
      fullName: registerCubit.name.text,
      email: registerCubit.email.text,
      dateOfBirth: selectedDateOfBirth!,
      bloodTypeId: AppConstants.bloodTypes.indexOf(selectedBloodType!) + 1,
      gender: genders.indexOf(selectedGender!) + 1,
      cityId: locCubit.townModels[selectedTownIndex].id!,
      password: registerCubit.pass.text,
      phoneNum: registerCubit.phone.text,
    );
  }
}
