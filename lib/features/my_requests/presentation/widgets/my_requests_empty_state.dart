import 'package:flutter/material.dart';


import '../../../home/presentation/pages/widgets/home_empty_state.dart';

class MyRequestsEmptyState extends StatelessWidget {
  const MyRequestsEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: HomeEmptyState());
  }
}
