import '../../data/models/personal_data_form.dart';

abstract class PersonalDataState {}

class PersonalDataLoading extends PersonalDataState {}

class PersonalDataLoaded extends PersonalDataState {
  final PersonalDataForm form;
  final bool isSaving;

  PersonalDataLoaded({required this.form, this.isSaving = false});

  PersonalDataLoaded copyWith({PersonalDataForm? form, bool? isSaving}) {
    return PersonalDataLoaded(
      form: form ?? this.form,
      isSaving: isSaving ?? this.isSaving,
    );
  }
}

class PersonalDataError extends PersonalDataState {
  final String message;

  PersonalDataError(this.message);
}

class PersonalDataSaveSuccess extends PersonalDataState {
  final PersonalDataForm form;
  final String message;

  PersonalDataSaveSuccess({required this.form, required this.message});
}

class PersonalDataSaveFailure extends PersonalDataState {
  final PersonalDataForm form;
  final String message;

  PersonalDataSaveFailure({required this.form, required this.message});
}
