import 'package:flutter/material.dart';

import 'search_and_filter_section.dart';

class SearchAndFilteringSliverAppBar extends StatelessWidget {
  final TextEditingController searchController;
  final ValueChanged<String> onSearchChanged;
  final ValueChanged<String> onSearchSubmitted;
  final Future<void> Function(
    bool suitableRequests,
    int sortingOption,
    int? governorateId,
    int? cityId,
  )
  onApplyFiltration;

  const SearchAndFilteringSliverAppBar({
    super.key,
    required this.searchController,
    required this.onSearchChanged,
    required this.onSearchSubmitted,
    required this.onApplyFiltration,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      snap: false,
      scrolledUnderElevation: 0,
      toolbarHeight: 100,
      backgroundColor: Colors.grey[100],
      elevation: 0,
      automaticallyImplyLeading: false,
      title: SearchAndFilterSection(
        searchController: searchController,
        onSearchChanged: onSearchChanged,
        onSearchSubmitted: onSearchSubmitted,
        onApplyFiltration: onApplyFiltration,
      ),
    );
  }
}
