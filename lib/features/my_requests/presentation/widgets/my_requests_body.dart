import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_text_styles.dart';
import '../cubit/my_requests_cubit.dart';
import '../cubit/my_requests_states.dart';
import 'my_requests_content.dart';

class MyRequestsBody extends StatelessWidget {
  const MyRequestsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyRequestsCubit, MyRequestsState>(
      builder: (context, state) {
        if (state is MyRequestsLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is MyRequestsFailure) {
          return Center(
            child: Text(state.errMsg, style: AppTextStyles.r16(context)),
          );
        }
        if (state is MyRequestsSuccess) {
          return MyRequestsContent(state: state);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
