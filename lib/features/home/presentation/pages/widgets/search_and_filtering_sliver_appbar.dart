import 'package:flutter/material.dart';

import 'search_and_filter_section.dart';

class SearchAndFilteringSliverAppBar extends StatelessWidget {
  final TextEditingController searchController;
  final ValueChanged<String> onSearchChanged;

  const SearchAndFilteringSliverAppBar({
    super.key,
    required this.searchController,
    required this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      snap: false,
      scrolledUnderElevation: 0,
      toolbarHeight: 90,
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: SearchAndFilterSection(
        searchController: searchController,
        onSearchChanged: onSearchChanged,
      ),
    );
  }
}
