import 'package:flutter/material.dart';

import '../../../domain/entities/request_entity.dart';
import 'request_card.dart';

class HomeRequestsSliver extends StatelessWidget {
  final List<RequestEntity> requests;
  final bool isLoading;
  final bool hasMore;
  final Future<void> Function()? onRefresh;

  const HomeRequestsSliver({
    super.key,
    required this.requests,
    required this.isLoading,
    required this.hasMore,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        if (index < requests.length) {
          final request = requests[index];
          return Padding(
            key: ValueKey(request.id),
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: RequestCard(
              entity: request,
              onRefresh: onRefresh,
            ),
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
