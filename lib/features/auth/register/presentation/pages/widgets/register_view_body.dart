import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/managers/location_cubit/cubit/location_cubit.dart';
import '../../../../../../core/managers/location_cubit/cubit/location_states.dart';
import '../../../../../../core/widgets/custom_auth_nav_button.dart';
import '../../../../../../generated/l10n.dart';
import '../../cubit/register_cubit.dart';
import 'drop_downs_section.dart';
import 'location_section.dart';
import 'password_section.dart';
import 'personal_info_section.dart';
import 'register_button_section.dart';

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
  Widget build(BuildContext context) {
    final locCubit = context.watch<LocationCubit>();
    final registerCubit = context.watch<RegisterCubit>();
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            const SizedBox(height: 20),
            PersonalInfoSection(registerCubit: registerCubit),
            const SizedBox(height: 16),
            DropdownsSection(
              genders: genders,
              selectedAge: selectedAge,
              selectedGender: selectedGender,
              selectedBloodType: selectedBloodType,
              onAgeChanged: (v) => setState(() => selectedAge = v),
              onGenderChanged: (v) => setState(() => selectedGender = v),
              onBloodChanged: (v) => setState(() => selectedBloodType = v),
            ),
            const SizedBox(height: 16),
            BlocListener<LocationCubit, LocationStates>(
              listenWhen: (previous, current) => current is SuccessTownLocState,
              listener: (context, state) {
                final loc = context.read<LocationCubit>();
                if (loc.towns.isNotEmpty) {
                  setState(() {
                    selectedCity = loc.towns.first;
                  });
                }
              },
              child: LocationSection(
                locCubit: locCubit,
                selectedGovernorate: selectedGovernorate,
                selectedCity: selectedCity,
                onGovernorateChanged: (v) {
                  setState(() {
                    selectedGovernorate = v;
                    selectedCity = null;
                    if (v != null) {
                      final idx = locCubit.cities.indexOf(v);
                      if (idx >= 0) {
                        locCubit.getTowns(idx + 1);
                      }
                    }
                  });
                },
                onCityChanged: (v) => setState(() => selectedCity = v),
              ),
            ),
            const SizedBox(height: 16),
            PasswordSection(registerCubit: registerCubit),
            const SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RegisterButtonSection(
                  formKey: _formKey,
                  registerCubit: registerCubit,
                  locCubit: locCubit,
                  genders: genders,
                  selectedAge: selectedAge,
                  selectedBloodType: selectedBloodType,
                  selectedGender: selectedGender,
                  selectedCity: selectedCity,
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomAuthNavButton(
              title: S.of(context).haveAcc,
              subTitle: S.of(context).loginHere,
              onPressed: () => context.pushReplacementNamed('login'),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
