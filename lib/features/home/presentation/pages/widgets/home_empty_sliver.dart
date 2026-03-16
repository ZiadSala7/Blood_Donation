import 'package:flutter/material.dart';

import 'home_empty_state.dart';

class HomeEmptySliver extends StatelessWidget {
  const HomeEmptySliver({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverFillRemaining(
      hasScrollBody: false,
      child: HomeEmptyState(),
    );
  }
}
