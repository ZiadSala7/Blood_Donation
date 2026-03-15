import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/managers/location_cubit/cubit/location_cubit.dart';
import '../../../../core/managers/location_cubit/cubit/location_states.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/show_awesome_dialog.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/personal_data_form.dart';
import '../cubit/personal_data_cubit.dart';
import '../cubit/personal_data_state.dart';
import 'personal_data_body.dart';

class PersonalDataContent extends StatefulWidget {
  const PersonalDataContent({super.key});

  @override
  State<PersonalDataContent> createState() => _PersonalDataContentState();
}

class _PersonalDataContentState extends State<PersonalDataContent> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _bloodTypeController = TextEditingController();
  final _emailController = TextEditingController();

  String? _selectedGovernorate;
  String? _selectedTown;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      context.read<LocationCubit>().getCities();
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _bloodTypeController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PersonalDataCubit, PersonalDataState>(
      listener: (context, state) {
        if (state is PersonalDataSaveSuccess) {
          showAwesomeDialog(
            context,
            S.of(context).successTitle,
            state.message,
            true,
            () {},
          );
          context.read<PersonalDataCubit>().restoreLoaded();
        } else if (state is PersonalDataSaveFailure) {
          showAwesomeDialog(
            context,
            S.of(context).errorTitle,
            state.message,
            false,
            () {},
          );
          context.read<PersonalDataCubit>().restoreLoaded();
        } else if (state is PersonalDataLoaded) {
          _applyFormOnce(context, state.form);
        }
      },
      builder: (context, state) {
        if (state is PersonalDataLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is PersonalDataError) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: AppColors.text),
            ),
          );
        }
        final loaded = state is PersonalDataLoaded
            ? state
            : state is PersonalDataSaveFailure
            ? PersonalDataLoaded(form: state.form)
            : state is PersonalDataSaveSuccess
            ? PersonalDataLoaded(form: state.form)
            : null;
        if (loaded == null) return const SizedBox.shrink();

        return BlocListener<LocationCubit, LocationStates>(
          listener: (context, locState) {
            if (locState is SuccessTownLocState) {
              if (_selectedTown == null &&
                  context.read<LocationCubit>().towns.isNotEmpty) {
                setState(() {
                  _selectedTown = context.read<LocationCubit>().towns.first;
                });
              }
            }
          },
          child: PersonalDataBody(
            nameController: _nameController,
            phoneController: _phoneController,
            bloodTypeController: _bloodTypeController,
            emailController: _emailController,
            selectedGovernorate: _selectedGovernorate,
            selectedTown: _selectedTown,
            onGovernorateChanged: _onGovernorateChanged,
            onTownChanged: (value) {
              setState(() => _selectedTown = value);
            },
            onSave: () => _handleSave(context),
            isSaving: loaded.isSaving,
          ),
        );
      },
    );
  }

  void _applyFormOnce(BuildContext context, PersonalDataForm form) {
    if (_initialized) return;
    _initialized = true;
    _nameController.text = form.name;
    _phoneController.text = form.phoneNumber;
    _bloodTypeController.text = form.bloodType;
    _emailController.text = form.email;
    _selectedGovernorate = form.governorate;
    _selectedTown = form.town;

    if (_selectedGovernorate != null) {
      final locCubit = context.read<LocationCubit>();
      final govId = _governorateIdFromName(
        _selectedGovernorate!,
        locCubit.cities,
      );
      if (govId != null) {
        locCubit.getTowns(govId);
      }
    }
  }

  void _onGovernorateChanged(String? value) {
    if (value == null) return;
    setState(() {
      _selectedGovernorate = value;
      _selectedTown = null;
    });
    final locCubit = context.read<LocationCubit>();
    final govId = _governorateIdFromName(value, locCubit.cities);
    if (govId != null) {
      locCubit.getTowns(govId);
    }
  }

  int? _governorateIdFromName(String name, List<String> cities) {
    final idx = cities.indexOf(name);
    if (idx < 0) return null;
    return idx + 1;
  }

  int? _selectedTownId(LocationCubit cubit) {
    if (_selectedTown == null) return null;
    for (final town in cubit.townModels) {
      if (town.nameAr == _selectedTown) return town.id?.toInt();
    }
    return null;
  }

  Future<void> _handleSave(BuildContext context) async {
    final locCubit = context.read<LocationCubit>();
    final cityId = _selectedTownId(locCubit);
    final phone = _phoneController.text.trim();

    await context.read<PersonalDataCubit>().save(
      phoneNumber: phone.isEmpty ? null : phone,
      cityId: cityId,
    );
  }
}
