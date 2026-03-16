import 'package:flutter/material.dart';

import 'pagination_bar.dart';

class MyRequestsPaginationSection extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final ValueChanged<int> onPageSelected;

  const MyRequestsPaginationSection({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return PaginationBar(
      currentPage: currentPage,
      totalPages: totalPages,
      onPageSelected: onPageSelected,
    );
  }
}
