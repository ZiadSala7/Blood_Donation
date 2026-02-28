import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/request_model.dart';
import '../../data/repo/home_repo_impl.dart';
import '../../domain/entities/request_entity.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  final HomeRepoImpl repo;
  List<RequestEntity> allEntities = [];
  List<RequestModel> allModels = [];
  HomeCubit(this.repo) : super(HomeInitial());

  Future<void> getRequestsWithPagination({int index = 1}) async {
    emit(HomeLoading());
    final response = await repo.getRequests(pageIndex: index);
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
        allEntities.addAll(entities);
        allModels.addAll(requests);
      }
      emit(HomeSuccess(requestEntities: entities));
    });
  }
}
