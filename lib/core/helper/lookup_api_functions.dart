import 'dart:developer';

import 'package:dio/dio.dart';

import '../di/injection.dart';
import '../api/end_points.dart';
import '../api/dio_consumer.dart';
import '../databases/cach_keys.dart';
import '../databases/cach_helper.dart';
import '../managers/location_cubit/models/town_model.dart';
import '../managers/location_cubit/repo/location_repo_impl.dart';

final prefs = getIt.get<CacheHelper>();
List<String> towns = [];
List<TownModel> townModels = [];

/// ======= here we will get all Governorates ============
Future<void> getAllGovs(DioConsumer dio) async {
  try {
    final response = await dio.get(EndPoints.governorates);
    List<String> governorates = [];
    List.generate(
      response.length,
      (index) => governorates.add(response[index]['NameAr']),
    );
    prefs.setStringList(CachKeys.governorates, governorates);
    log(governorates.toString());
  } catch (e) {
    return;
  }
}

List<String> getAllCachedGovs() {
  final list = prefs.getStringList(CachKeys.governorates);
  return list!;
}

/// ================ get all donation categories =============
Future<void> getAllDonationCats(DioConsumer dio) async {
  try {
    final response = await dio.get(EndPoints.donationCat);
    List<String> donationCats = [];
    List.generate(
      response.length,
      (index) => donationCats.add(response[index]['NameAr']),
    );
    prefs.setStringList(CachKeys.donationCats, donationCats);
  } catch (e) {
    return;
  }
}

List<String> getAllCachedCats() {
  final list = prefs.getStringList(CachKeys.donationCats);
  return list!;
}

/// ============== get towns in governorate =================
Future<void> getTownsInGovernorate(LocationRepoImpl repo, int city) async {
  final response = await repo.getTownsByGovrnrat(city);
  response.fold((ifLeft) => null, (twnModels) {
    townModels = twnModels;
    List.generate(
      twnModels.length,
      (index) => towns.add(twnModels[index].nameAr),
    );
    prefs.setStringList(CachKeys.citiesInGov, towns);
    prefs.setInt(CachKeys.firstCityId, townModels[0].id!);
  });
}

/// ============== get all gov cities ===================
Future getTowns(LocationRepoImpl repo, int city) async {
  towns = [];
  final response = await repo.getTownsByGovrnrat(city);
  response.fold((ifLeft) => null, (allTowns) {
    townModels = allTowns;
    List.generate(
      allTowns.length,
      (index) => towns.add(townModels[index].nameAr),
    );
    prefs.setInt(CachKeys.firstCityId, city);
  });
}

/// =================== to init towns ======================
Future<void> initTowns() async {
  final cityNum = getIt.get<CacheHelper>().getInt(CachKeys.firstCityId);
  cityNum ??
      await getTowns(LocationRepoImpl(dio: DioConsumer(dio: Dio())), cityNum!);
}
