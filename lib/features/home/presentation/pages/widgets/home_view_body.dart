import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../auth/login/presentation/cubit/login_cubit.dart';
import '../../../../auth/register/data/models/register_model.dart';
import '../../cubit/home_cubit.dart';
import '../../cubit/home_states.dart';
import 'details_sliver_appbar.dart';
import 'nearby_requests_divider.dart';
import 'request_card.dart';
import 'search_and_filtering_sliver_appbar.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late RegisterModel model;

  @override
  void initState() {
    model = context.read<LoginCubit>().model!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            DetailsSliverAppBar(model: model),
            const SearchAndFilteringSliverAppBar(),
            const SliverToBoxAdapter(child: NearbyRequestsDivider()),
            SliverToBoxAdapter(
              child: state is HomeSuccess
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      child: SizedBox(
                        height: 500,
                        child: ListView.builder(
                          itemCount: state.requestEntities.length,
                          itemBuilder: (context, index) =>
                              RequestCard(entity: state.requestEntities[index]),
                        ),
                      ),
                    )
                  : state is HomeLoading
                  ? const SizedBox(
                      height: 500,
                      child: Column(
                        mainAxisAlignment: .center,
                        crossAxisAlignment: .center,
                        children: [
                          CircularProgressIndicator(),
                          Text('جار التحميل ....'),
                        ],
                      ),
                    )
                  : state is HomeFailure
                  ? SizedBox(
                      height: 500,
                      child: Center(child: Text(state.errMsg)),
                    )
                  : const SizedBox(),
            ),
          ],
        );
      },
      listener: (context, state) {},
    );
  }
}
