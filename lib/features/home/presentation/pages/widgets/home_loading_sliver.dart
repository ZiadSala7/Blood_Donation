import 'package:flutter/material.dart';

class HomeLoadingSliver extends StatelessWidget {
  const HomeLoadingSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverFillRemaining(
      hasScrollBody: false,
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
