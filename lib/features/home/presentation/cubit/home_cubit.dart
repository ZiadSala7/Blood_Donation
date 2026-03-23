import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/request_model.dart';
import '../../domain/entities/request_entity.dart';
import '../../domain/repo/home_repo.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  final HomeRepo repo;
  List<RequestEntity> allEntities = [];
  List<RequestModel> allModels = [];
  String? searchFilter;
  bool? suitableRequestsFilter;
  int? sortingOptionFilter;
  int? governorateIdFilter;
  int? cityIdFilter;

  HomeCubit(this.repo) : super(HomeInitial());

  Future<void> refreshRequests() async {
    allEntities.clear();
    allModels.clear();
    await getRequestsWithPagination(index: 1);
  }

  Future<void> applyFiltration({
    required bool suitableRequests,
    required int sortingOption,
    int? governorateId,
    int? cityId,
  }) async {
    suitableRequestsFilter = suitableRequests;
    sortingOptionFilter = sortingOption;
    governorateIdFilter = governorateId;
    cityIdFilter = cityId;
    await refreshRequests();
  }

  Future<void> applySearch(String query) async {
    final trimmed = query.trim();
    searchFilter = trimmed.isEmpty ? null : trimmed;
    await refreshRequests();
  }

  Future<void> getRequestsWithPagination({int index = 1}) async {
    emit(HomeLoading());
    final response = await repo.getRequests(
      pageIndex: index,
      patientName: searchFilter,
      suitableRequests: suitableRequestsFilter,
      sortingOption: sortingOptionFilter,
      governorateId: governorateIdFilter,
      cityId: cityIdFilter,
    );
    response.fold((error) => emit(HomeFailure(errMsg: error)), (requests) {
      List<RequestEntity> entities = [];
      for (int i = 0; i < requests.length; i++) {
        RequestEntity entity = RequestEntity(
          id: requests[i].id!,
          bagsCnt: requests[i].bagsCount ?? 5,
          collectedBags: requests[i].collectedBags!,
          status: requests[i].status!,
          patientName: requests[i].patientName!,
          hospitalName: requests[i].hospitalName!,
          cityAr: requests[i].cityAr!,
          deadline: requests[i].deadline!,
          donationCategoryAr: requests[i].donationCategoryAr,
          requiredBloodType: requests[i].requiredBloodType,
        );
        entities.add(entity);
      }
      allEntities.addAll(entities);
      allModels.addAll(requests);
      emit(HomeSuccess(requestEntities: entities));
    });
  }

  Future<Either<String, RequestModel>> getRequestById({required int id}) {
    return repo.getRequestById(id: id);
  }

  void updateRequest(RequestModel updated) {
    final id = updated.id;
    if (id == null) return;

    final modelIndex = allModels.indexWhere((model) => model.id == id);
    if (modelIndex != -1) {
      allModels[modelIndex] = updated;
    }

    final entityIndex = allEntities.indexWhere((entity) => entity.id == id);
    if (entityIndex != -1) {
      final current = allEntities[entityIndex];
      allEntities[entityIndex] = RequestEntity(
        id: id,
        bagsCnt: updated.bagsCount ?? current.bagsCnt,
        collectedBags: updated.collectedBags ?? current.collectedBags,
        status: updated.status ?? current.status,
        patientName: updated.patientName ?? current.patientName,
        hospitalName: updated.hospitalName ?? current.hospitalName,
        cityAr: updated.cityAr ?? current.cityAr,
        deadline: updated.deadline ?? current.deadline,
        donationCategoryAr:
            updated.donationCategoryAr ?? current.donationCategoryAr,
        requiredBloodType:
            updated.requiredBloodType ?? current.requiredBloodType,
      );
    }

    if (state is HomeSuccess) {
      emit(HomeSuccess(requestEntities: List<RequestEntity>.from(allEntities)));
    }
  }
}
