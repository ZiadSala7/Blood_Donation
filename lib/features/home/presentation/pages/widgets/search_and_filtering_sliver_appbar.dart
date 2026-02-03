import 'package:flutter/material.dart';

import 'search_and_filter_section.dart';

class SearchAndFilteringSliverAppBar extends StatelessWidget {
  const SearchAndFilteringSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      pinned: true,
      floating: false,
      snap: false,
      scrolledUnderElevation: 0,
      toolbarHeight: 100,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: SearchAndFilterSection(),
    );
  }
}
