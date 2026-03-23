import 'package:flutter/material.dart';

import '../../../../auth/register/data/models/register_model.dart';
import '../../../domain/entities/request_entity.dart';
import 'home_view_content.dart';

class HomeViewBodyContent extends StatelessWidget {
  final RegisterModel model;
  final ScrollController scrollController;
  final TextEditingController searchController;
  final Future<void> Function() onRefresh;
  final Future<void> Function(String value) onSearchChanged;
  final Future<void> Function(String value) onSearchSubmitted;
  final Future<void> Function(
    bool suitableRequests,
    int sortingOption,
    int? governorateId,
    int? cityId,
  )
  onApplyFiltration;
  final List<RequestEntity> requests;
  final bool isInitialLoading;
  final bool showEmptyState;
  final bool isLoading;
  final bool hasMore;

  const HomeViewBodyContent({
    super.key,
    required this.model,
    required this.scrollController,
    required this.searchController,
    required this.onRefresh,
    required this.onSearchChanged,
    required this.onSearchSubmitted,
    required this.onApplyFiltration,
    required this.requests,
    required this.isInitialLoading,
    required this.showEmptyState,
    required this.isLoading,
    required this.hasMore,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: HomeViewContent(
        model: model,
        scrollController: scrollController,
        searchController: searchController,
        onSearchChanged: onSearchChanged,
        onSearchSubmitted: onSearchSubmitted,
        onApplyFiltration: onApplyFiltration,
        onRefresh: onRefresh,
        requests: requests,
        isInitialLoading: isInitialLoading,
        showEmptyState: showEmptyState,
        isLoading: isLoading,
        hasMore: hasMore,
      ),
    );
  }
}
