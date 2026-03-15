import '../../data/models/personal_request_response.dart';

abstract class MyRequestsState {}

class MyRequestsInitial extends MyRequestsState {}

class MyRequestsLoading extends MyRequestsState {}

class MyRequestsFailure extends MyRequestsState {
  final String errMsg;

  MyRequestsFailure({required this.errMsg});
}

class MyRequestsSuccess extends MyRequestsState {
  final int pageIndex;
  final int selectedIndex;
  final int totalPages;
  final List<PersonalRequestItem> items;

  MyRequestsSuccess({
    required this.pageIndex,
    required this.selectedIndex,
    required this.totalPages,
    required this.items,
  });
}
