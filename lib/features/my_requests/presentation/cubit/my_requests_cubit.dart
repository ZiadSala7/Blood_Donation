import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/personal_request_response.dart';
import '../../domain/repo/my_requests_repo.dart';
import '../models/confirm_request_result.dart';
import 'my_requests_states.dart';

class MyRequestsCubit extends Cubit<MyRequestsState> {
  final MyRequestsRepo repo;
  int _pageIndex = 1;
  int _totalPages = 1;
  List<PersonalRequestItem> _items = [];

  MyRequestsCubit(this.repo) : super(MyRequestsInitial());

  int get pageIndex => _pageIndex;
  int get totalPages => _totalPages;
  List<PersonalRequestItem> get items => _items;

  Future<void> loadPage(int pageIndex) async {
    emit(MyRequestsLoading());
    final result = await repo.getPersonalRequests(pageIndex: pageIndex);
    result.fold(
      (err) => emit(MyRequestsFailure(errMsg: err)),
      (data) {
        _pageIndex = data.pageIndex;
        _items = data.items;
        _totalPages = _calculateTotalPages(
          data.totalSize,
          data.pageSize,
        );
        emit(
          MyRequestsSuccess(
            pageIndex: _pageIndex,
            totalPages: _totalPages,
            items: _items,
          ),
        );
      },
    );
  }

  Future<void> refresh() async {
    await loadPage(_pageIndex);
  }

  Future<ConfirmRequestResult> confirmRequest({
    required int requestId,
    required String donorId,
    required int hasDonated,
  }) async {
    final result = await repo.confirmRequest(
      id: requestId,
      donorId: donorId,
      hasDonated: hasDonated,
    );
    return await result.fold(
      (err) async => ConfirmRequestResult(success: false, message: err),
      (msg) async {
        await refresh();
        return ConfirmRequestResult(success: true, message: msg);
      },
    );
  }

  int _calculateTotalPages(int totalSize, int pageSize) {
    if (pageSize <= 0) return 1;
    final pages = (totalSize / pageSize).ceil();
    return pages < 1 ? 1 : pages;
  }
}
