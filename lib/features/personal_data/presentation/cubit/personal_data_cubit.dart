import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/get_user.dart';
import '../../domain/repo/personal_data_repo.dart';
import '../../data/models/personal_data_form.dart';
import 'personal_data_state.dart';

class PersonalDataCubit extends Cubit<PersonalDataState> {
  final PersonalDataRepo repo;

  PersonalDataCubit(this.repo) : super(PersonalDataLoading());

  Future<void> load() async {
    emit(PersonalDataLoading());

    final cached = getCachedUser();
    final profile = await repo.getProfile();

    final name = profile?.name.isNotEmpty == true
        ? profile!.name
        : (cached?.name ?? '-');
    final email = cached?.email ?? '-';
    final bloodType = profile?.bloodType.isNotEmpty == true
        ? profile!.bloodType
        : 'A+';
    final phone = profile?.phone.isNotEmpty == true
        ? profile!.phone
        : '';

    final form = PersonalDataForm(
      name: name,
      email: email,
      bloodType: bloodType,
      phoneNumber: phone,
      governorate: cached?.governorateName,
      town: cached?.cityName,
    );

    emit(PersonalDataLoaded(form: form));
  }

  Future<void> save({required String? phoneNumber, required int? cityId}) async {
    final current = state;
    if (current is! PersonalDataLoaded) return;
    emit(current.copyWith(isSaving: true));

    final result = await repo.updatePersonalData(
      phoneNumber: phoneNumber,
      cityId: cityId,
    );

    result.fold(
      (err) => emit(PersonalDataSaveFailure(form: current.form, message: err)),
      (_) => emit(
        PersonalDataSaveSuccess(
          form: current.form,
          message: 'تم حفظ التغييرات',
        ),
      ),
    );
  }

  void restoreLoaded() {
    final current = state;
    if (current is PersonalDataSaveFailure) {
      emit(PersonalDataLoaded(form: current.form));
    } else if (current is PersonalDataSaveSuccess) {
      emit(PersonalDataLoaded(form: current.form));
    }
  }
}
