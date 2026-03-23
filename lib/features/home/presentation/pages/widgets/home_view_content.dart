import 'package:flutter/material.dart';

import '../../../../auth/register/data/models/register_model.dart';
import '../../../domain/entities/request_entity.dart';
import 'details_sliver_appbar.dart';
import 'home_empty_sliver.dart';
import 'home_loading_sliver.dart';
import 'home_requests_sliver.dart';
import 'nearby_requests_divider.dart';
import 'search_and_filtering_sliver_appbar.dart';

class HomeViewContent extends StatelessWidget {
  final RegisterModel model;
  final ScrollController scrollController;
  final TextEditingController searchController;
  final ValueChanged<String> onSearchChanged;
  final ValueChanged<String> onSearchSubmitted;
  final Future<void> Function(bool, int, int?, int?) onApplyFiltration;
  final Future<void> Function() onRefresh;
  final List<RequestEntity> requests;
  final bool isInitialLoading;
  final bool showEmptyState;
  final bool isLoading;
  final bool hasMore;

  const HomeViewContent({
    super.key,
    required this.model,
    required this.scrollController,
    required this.searchController,
    required this.onSearchChanged,
    required this.onSearchSubmitted,
    required this.onApplyFiltration,
    required this.onRefresh,
    required this.requests,
    required this.isInitialLoading,
    required this.showEmptyState,
    required this.isLoading,
    required this.hasMore,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        DetailsSliverAppBar(model: model),
        SearchAndFilteringSliverAppBar(
          searchController: searchController,
          onSearchChanged: onSearchChanged,
          onSearchSubmitted: onSearchSubmitted,
          onApplyFiltration: onApplyFiltration,
        ),
        const SliverToBoxAdapter(child: NearbyRequestsDivider()),
        if (isInitialLoading)
          const HomeLoadingSliver()
        else if (showEmptyState)
          const HomeEmptySliver()
        else
          HomeRequestsSliver(
            requests: requests,
            isLoading: isLoading,
            hasMore: hasMore,
            onRefresh: onRefresh,
          ),
      ],
    );
  }
}
