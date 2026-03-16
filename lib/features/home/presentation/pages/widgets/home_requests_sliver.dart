import 'package:flutter/material.dart';

import '../../../domain/entities/request_entity.dart';
import 'request_card.dart';

class HomeRequestsSliver extends StatelessWidget {
  final List<RequestEntity> requests;
  final bool isLoading;
  final bool hasMore;

  const HomeRequestsSliver({
    super.key,
    required this.requests,
    required this.isLoading,
    required this.hasMore,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        if (index < requests.length) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: RequestCard(entity: requests[index]),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: isLoading ? const CircularProgressIndicator() : const SizedBox(),
          ),
        );
      }, childCount: requests.length + (hasMore ? 1 : 0)),
    );
  }
}
