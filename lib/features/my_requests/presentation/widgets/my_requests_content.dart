import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/l10n.dart';
import '../cubit/my_requests_cubit.dart';
import '../cubit/my_requests_states.dart';
import 'my_requests_empty_state.dart';
import 'my_requests_pagination_section.dart';
import 'my_requests_request_details_section.dart';
import 'my_requests_responses_section.dart';

class MyRequestsContent extends StatelessWidget {
  final MyRequestsSuccess state;

  const MyRequestsContent({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final itemIndex = state.selectedIndex - 1;
    final item = state.items.isNotEmpty && itemIndex < state.items.length
        ? state.items[itemIndex]
        : null;

    return ListView(
      padding: const EdgeInsets.all(5),
      children: [
        if (item != null) ...[
          MyRequestsRequestDetailsSection(item: item),
          const SizedBox(height: 16),
          Text(
            S.of(context).donorResponsesTitle,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          MyRequestsResponsesSection(item: item),
        ] else ...[
          const SizedBox(height: 30),
          const MyRequestsEmptyState(),
        ],
        const SizedBox(height: 12),
        MyRequestsPaginationSection(
          currentPage: state.selectedIndex,
          totalPages: state.totalPages,
          onPageSelected: (page) =>
              context.read<MyRequestsCubit>().selectIndex(page),
        ),
      ],
    );
  }
}
