import '../../domain/entities/request_entity.dart';

abstract class HomeStates {}

class HomeInitial extends HomeStates {}

class HomeLoading extends HomeStates {}

class HomeFailure extends HomeStates {
  final String errMsg;

  HomeFailure({required this.errMsg});
}

class HomeSuccess extends HomeStates {
  final List<RequestEntity> requestEntities;

  HomeSuccess({required this.requestEntities});
}
