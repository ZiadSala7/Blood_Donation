import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/api/dio_consumer.dart';
import '../../../../core/di/injection.dart';
import '../../../../generated/l10n.dart';
import '../../data/repo/personal_data_repo_impl.dart';
import '../cubit/personal_data_cubit.dart';
import '../widgets/personal_data_app_bar.dart';
import '../widgets/personal_data_content.dart';

class PersonalDataView extends StatelessWidget {
  const PersonalDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PersonalDataCubit(
        PersonalDataRepoImpl(dio: getIt.get<DioConsumer>()),
      )..load(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: PersonalDataAppBar(title: S.of(context).profilePersonalDataTitle),
          body: const SafeArea(child: PersonalDataContent()),
        ),
      ),
    );
  }
}
