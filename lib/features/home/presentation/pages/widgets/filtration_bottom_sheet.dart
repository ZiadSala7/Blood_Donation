import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/managers/location_cubit/cubit/location_cubit.dart';
import '../../../../../core/managers/location_cubit/cubit/location_states.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'filtration_bottom_sheet_header.dart';
import 'filtration_location_section.dart';
import 'filtration_medical_only_switch.dart';
import 'filtration_sort_section.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  bool isMedicalOnly = false;

  String? selectedGovernorate;
  String? selectedTown;

  int selectedSort = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LocationCubit>().getCities();
    });
  }

  void _resetFilters() {
    setState(() {
      isMedicalOnly = false;
      selectedGovernorate = null;
      selectedTown = null;
      selectedSort = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final locCubit = context.watch<LocationCubit>();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FilterBottomSheetHeader(onReset: _resetFilters),
          const SizedBox(height: 20),
          FiltrationMedicalOnlySwitch(
            value: isMedicalOnly,
            onChanged: (value) {
              setState(() {
                isMedicalOnly = value;
              });
            },
          ),
          const SizedBox(height: 20),
          BlocListener<LocationCubit, LocationStates>(
            listenWhen: (previous, current) => current is SuccessTownLocState,
            listener: (context, state) {
              if (locCubit.towns.isNotEmpty && selectedTown == null) {
                setState(() {
                  selectedTown = locCubit.towns.first;
                });
              }
            },
            child: FiltrationLocationSection(
              selectedGovernorate: selectedGovernorate,
              selectedTown: selectedTown,
              cities: locCubit.cities,
              towns: locCubit.towns,
              isTownsLoading:
                  locCubit.state is LoadingLocState &&
                  selectedGovernorate != null,
              onGovernorateChanged: (value) {
                setState(() {
                  selectedGovernorate = value;
                  selectedTown = null;
                  if (value != null && value.isNotEmpty) {
                    final idx = locCubit.cities.indexOf(value);
                    if (idx >= 0) {
                      locCubit.getTowns(idx + 1);
                    }
                  }
                });
              },
              onTownChanged: (value) {
                setState(() {
                  selectedTown = value;
                });
              },
            ),
          ),
          const SizedBox(height: 20),
          FiltrationSortSection(
            selectedSort: selectedSort,
            onSortSelected: (index) {
              setState(() {
                selectedSort = index;
              });
            },
          ),

          const SizedBox(height: 24),

          Column(
            crossAxisAlignment: .stretch,
            children: [CustomButton(label: "عرض النتائج", onPressed: () {})],
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
