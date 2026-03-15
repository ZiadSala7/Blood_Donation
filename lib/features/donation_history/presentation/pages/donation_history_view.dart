import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/api/dio_consumer.dart';
import '../../../../core/di/injection.dart';
import '../../data/repo/donation_history_repo_impl.dart';
import '../cubit/donation_history_cubit.dart';
import '../widgets/donation_history_app_bar.dart';
import '../widgets/donation_history_body.dart';

class DonationHistoryView extends StatelessWidget {
  const DonationHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DonationHistoryCubit(
        DonationHistoryRepoImpl(dio: getIt.get<DioConsumer>()),
      )..loadHistory(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: const DonationHistoryAppBar(),
          body: const SafeArea(child: DonationHistoryBody()),
        ),
      ),
    );
  }
}
