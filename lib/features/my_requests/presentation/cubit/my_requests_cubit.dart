import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/personal_request_response.dart';
import '../../domain/repo/my_requests_repo.dart';
import '../models/confirm_request_result.dart';
import 'my_requests_states.dart';

class MyRequestsCubit extends Cubit<MyRequestsState> {
  final MyRequestsRepo repo;
  int _pageIndex = 1;
  int _totalPages = 1;
  int _selectedIndex = 1;
  List<PersonalRequestItem> _items = [];
  final Map<int, Set<String>> _confirmedDonors = {};

  MyRequestsCubit(this.repo) : super(MyRequestsInitial());

  int get pageIndex => _pageIndex;
  int get totalPages => _totalPages;
  int get selectedIndex => _selectedIndex;
  List<PersonalRequestItem> get items => _items;
  bool isConfirmed(int requestId, String donorId) {
    return _confirmedDonors[requestId]?.contains(donorId) ?? false;
  }

  Future<void> loadPage(int pageIndex) async {
    emit(MyRequestsLoading());
    final result = await repo.getPersonalRequests(pageIndex: pageIndex);
    result.fold((err) => emit(MyRequestsFailure(errMsg: err)), (data) {
      _pageIndex = data.pageIndex;
      _items = data.items;
      _selectedIndex = 1;
      _totalPages = _items.isEmpty ? 1 : _items.length;
      emit(
        MyRequestsSuccess(
          pageIndex: _pageIndex,
          selectedIndex: _selectedIndex,
          totalPages: _totalPages,
          items: _items,
        ),
      );
    });
  }

  Future<void> refresh() async {
    await loadPage(_pageIndex);
  }

  void selectIndex(int index) {
    if (_items.isEmpty) return;
    final clamped = index.clamp(1, _items.length);
    _selectedIndex = clamped;
    emit(
      MyRequestsSuccess(
        pageIndex: _pageIndex,
        selectedIndex: _selectedIndex,
        totalPages: _items.length,
        items: _items,
      ),
    );
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
        if (hasDonated == 1) {
          _confirmedDonors
              .putIfAbsent(requestId, () => <String>{})
              .add(donorId);
        }
        await refresh();
        return ConfirmRequestResult(success: true, message: msg);
      },
    );
  }

}
