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
  late final ScrollController scrollController;

  int nextPage = 2;
  bool isLoading = false;
  bool hasMore = true;

  @override
  void initState() {
    super.initState();
    model = context.read<LoginCubit>().model!;
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
  }

  void scrollListener() {
    if (!scrollController.hasClients || isLoading || !hasMore) return;

    final currentPosition = scrollController.position.pixels;
    final maxScroll = scrollController.position.maxScrollExtent;

    // On larger screens (e.g. tablets) the list might not be scrollable at all.
    // In that case maxScroll will be 0, so we avoid triggering pagination
    // to prevent showing a loading indicator without real pagination.
    if (maxScroll <= 0) return;

    if (currentPosition >= maxScroll - 200) {
      isLoading = true;
      context.read<HomeCubit>().getRequestsWithPagination(index: nextPage++);
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is HomeSuccess) {
          isLoading = false;
          if (state.requestEntities.isEmpty) {
            hasMore = false;
          }
        } else if (state is HomeFailure) {
          isLoading = false;
        }
      },
      builder: (context, state) {
        final requests = context.read<HomeCubit>().allEntities;
        return CustomScrollView(
          controller: scrollController,
          slivers: [
            DetailsSliverAppBar(model: model),
            const SearchAndFilteringSliverAppBar(),
            const SliverToBoxAdapter(child: NearbyRequestsDivider()),

            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                if (index < requests.length) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: RequestCard(entity: requests[index]),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
              }, childCount: requests.length + (hasMore ? 1 : 0)),
            ),
          ],
        );
      },
    );
  }
}
