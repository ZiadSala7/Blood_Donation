import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/helper/lookup_api_functions.dart';
import '../../data/repo/add_request_repo_impl.dart';
import 'add_request_states.dart';

class AddRequestCubit extends Cubit<AddRequestStates> {
  final AddRequestRepoImpl repo;
  AddRequestCubit(this.repo) : super(InitialAddRequestState());

  TextEditingController patientName = TextEditingController();
  TextEditingController dscrptionName = TextEditingController();
  TextEditingController hsptalName = TextEditingController();
  TextEditingController phoneNum = TextEditingController();
  int bagsCount = 0;
  String? selectedGovernorate, selectedTown, selectedBloodType, selectedDonCat;
  late DateTime? deadline;
  List<String> donationCats = [];
  final addRqstFormKey = GlobalKey<FormState>();

  /// here we make a function to create request
  Future<void> createRequest({required int cityId}) async {
    emit(LoadingAddRequestState());
    int donCatIndx = getAllCachedCats().indexOf(selectedDonCat!);
    final response = await repo.createBloodRequest(
      patientName: patientName.text,
      descriptionName: dscrptionName.text,
      hospitalName: hsptalName.text,
      cityId: cityId,
      bagsCount: bagsCount,
      donationCategoryId: donCatIndx + 1,
      requiredBloodTypeId:
          AppConstants.bloodTypes.indexOf(selectedBloodType!) + 1,
      deadline: deadline!,
      phoneNumber: phoneNum.text,
    );
    response.fold(
      (ifLeft) => emit(FailureAddRequestState(errMsg: ifLeft)),
      (ifRight) => emit(SuccessAddRequestState()),
    );
  }

  void clearData() {
    patientName.clear();
    dscrptionName.clear();
    hsptalName.clear();
    phoneNum.clear();
    selectedBloodType = selectedDonCat = selectedGovernorate = selectedTown =
        null;
    deadline = null;
    bagsCount = 2;
  }
}
