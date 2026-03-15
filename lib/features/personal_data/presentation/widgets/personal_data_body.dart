import 'package:flutter/material.dart';

import 'personal_data_form.dart';
import 'personal_data_save_button.dart';

class PersonalDataBody extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController bloodTypeController;
  final TextEditingController emailController;
  final String? selectedGovernorate;
  final String? selectedTown;
  final ValueChanged<String?> onGovernorateChanged;
  final ValueChanged<String?> onTownChanged;
  final VoidCallback onSave;
  final bool isSaving;

  const PersonalDataBody({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.bloodTypeController,
    required this.emailController,
    required this.selectedGovernorate,
    required this.selectedTown,
    required this.onGovernorateChanged,
    required this.onTownChanged,
    required this.onSave,
    required this.isSaving,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .stretch,
          spacing: 120,
          children: [
            PersonalDataFormSection(
              nameController: nameController,
              phoneController: phoneController,
              bloodTypeController: bloodTypeController,
              emailController: emailController,
              selectedGovernorate: selectedGovernorate,
              selectedTown: selectedTown,
              onGovernorateChanged: onGovernorateChanged,
              onTownChanged: onTownChanged,
            ),
            PersonalDataSaveButton(isSaving: isSaving, onPressed: onSave),
          ],
        ),
      ),
    );
  }
}
