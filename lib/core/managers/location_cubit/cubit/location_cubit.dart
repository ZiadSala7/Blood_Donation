import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/town_model.dart';
import '../repo/location_repo_impl.dart';
import '../../../databases/cach_helper.dart';
import 'location_states.dart';
import '../../../di/injection.dart';

class LocationCubit extends Cubit<LocationStates> {
  final LocationRepoImpl repo;
  LocationCubit(this.repo) : super(InitialLocState());

  List<String> cities = [];
  List<String> towns = [];
  List<TownModel> townModels = [];
  final prefs = getIt.get<CacheHelper>();

  void initLists() {}
  Future getCities() async {
    emit(LoadingLocState());
    final response = await repo.getAllGovernorates();
    response.fold((ifLeft) => emit(FailureLocState()), (allCities) {
      cities = allCities;
      emit(SuccessLocState());
    });
  }

  Future getTowns(num city) async {
    emit(LoadingLocState());
    final response = await repo.getTownsByGovrnrat(city);
    response.fold((ifLeft) => emit(FailureLocState()), (allTowns) {
      townModels = allTowns;
      for (int i = 0; i < townModels.length; i++) {
        towns.add(townModels[i].nameAr);
      }
      emit(SuccessLocState());
    });
  }
}
