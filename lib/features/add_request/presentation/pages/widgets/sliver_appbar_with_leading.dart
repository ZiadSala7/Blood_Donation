import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SliverAppBarWithLeading extends StatelessWidget {
  const SliverAppBarWithLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      toolbarHeight: 50,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () => GoRouter.of(context).pop(),
        icon: const Icon(Icons.arrow_back_ios, size: 20),
      ),
    );
  }
}
