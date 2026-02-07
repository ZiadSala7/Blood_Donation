import 'package:blood_donation/core/helper/lookup_api_functions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../databases/cach_keys.dart';
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
    cities = getAllCachedGovs();
    emit(SuccessCityLocState());
  }

  Future getTowns(int city) async {
    emit(LoadingLocState());
    towns = [];
    final response = await repo.getTownsByGovrnrat(city);
    response.fold((ifLeft) => emit(FailureLocState()), (allTowns) {
      townModels = allTowns;
      List.generate(
        allTowns.length,
        (index) => towns.add(townModels[index].nameAr),
      );
      prefs.setInt(CachKeys.firstCityId, city);
      emit(SuccessTownLocState());
    });
  }
}
