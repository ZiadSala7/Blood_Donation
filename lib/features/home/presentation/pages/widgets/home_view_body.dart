import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../auth/login/presentation/cubit/login_cubit.dart';
import 'nearby_requests_divider.dart';
import 'request_card.dart';
import 'search_and_filter_section.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<LoginCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          const SizedBox(height: 20),
          Column(
            mainAxisAlignment: .end,
            crossAxisAlignment: .stretch,
            children: [
              Text(
                '👋أهلا: ${cubit.model.name!}',
                style: AppTextStyles.b24(context),
              ),
              const Text('       سوهاج : أخميم'),
              const SearchAndFilterSection(),
              const SizedBox(height: 28),
              const NearbyRequestsDivider(),

              /// Card of Blood Donation request
              const RequestCard(),
            ],
          ),
        ],
      ),
    );
  }
}
