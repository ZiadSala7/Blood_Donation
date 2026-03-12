import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../request_details/presentation/widgets/header_card.dart';
import '../../../request_details/presentation/widgets/progress_card.dart';
import '../../../request_details/presentation/widgets/stats_card.dart';
import '../cubit/my_requests_cubit.dart';
import '../cubit/my_requests_states.dart';
import 'pagination_bar.dart';
import 'request_responses_list.dart';

class MyRequestsContent extends StatelessWidget {
  final MyRequestsSuccess state;

  const MyRequestsContent({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final item = state.items.isNotEmpty ? state.items.first : null;
    return ListView(
      padding: const EdgeInsets.all(5),
      children: [
        if (item != null) ...[
          HeaderCard(item.request),
          const SizedBox(height: 12),
          Card(
            color: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                spacing: 15,
                children: [StatsCard(item.request), ProgressCard(item.request)],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'استجابات المتبرعين',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          RequestResponsesList(item: item),
        ] else ...[
          const SizedBox(height: 30),
          Center(
            child: Text(
              'لا توجد طلبات حالياً',
              style: AppTextStyles.r16(context),
            ),
          ),
        ],
        PaginationBar(
          currentPage: state.pageIndex,
          totalPages: state.totalPages,
          onPageSelected: (page) =>
              context.read<MyRequestsCubit>().loadPage(page),
        ),
      ],
    );
  }
}
