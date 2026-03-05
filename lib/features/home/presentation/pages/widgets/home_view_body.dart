import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../auth/login/presentation/cubit/login_cubit.dart';
import '../../../../auth/register/data/models/register_model.dart';
import '../../cubit/home_cubit.dart';
import '../../cubit/home_states.dart';
import '../../../domain/entities/request_entity.dart';
import 'details_sliver_appbar.dart';
import 'home_empty_state.dart';
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
  late final TextEditingController searchController;

  int nextPage = 2;
  bool isLoading = false;
  bool hasMore = true;
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    model = context.read<LoginCubit>().model!;
    scrollController = ScrollController();
    searchController = TextEditingController();
    scrollController.addListener(scrollListener);
  }

  bool _matchesSearch(String source) {
    return source.toLowerCase().contains(searchQuery);
  }

  List<RequestEntity> _applySearch(List<RequestEntity> requests) {
    if (searchQuery.isEmpty) return requests;
    return requests.where((request) {
      return _matchesSearch(request.hospitalName!) ||
          _matchesSearch(request.patientName!) ||
          _matchesSearch(request.cityAr!) ||
          _matchesSearch(request.donationCategoryAr ?? '') ||
          _matchesSearch(request.requiredBloodType ?? '');
    }).toList();
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

  Future<void> _onRefresh() async {
    setState(() {
      nextPage = 2;
      isLoading = false;
      hasMore = true;
    });
    await context.read<HomeCubit>().refreshRequests();
  }

  @override
  void dispose() {
    scrollController.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is HomeSuccess) {
          setState(() {
            isLoading = false;
          });
          if (state.requestEntities.isEmpty) {
            setState(() {
              hasMore = false;
            });
          }
        } else if (state is HomeFailure) {
          setState(() {
            isLoading = false;
          });
        }
      },
      builder: (context, state) {
        final allRequests = context.read<HomeCubit>().allEntities;
        final requests = _applySearch(allRequests);
        final isInitialLoading = state is HomeLoading && allRequests.isEmpty;
        final showEmptyState = requests.isEmpty && !isInitialLoading;

        return RefreshIndicator(
          onRefresh: _onRefresh,
          child: CustomScrollView(
            controller: scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              DetailsSliverAppBar(model: model),
              SearchAndFilteringSliverAppBar(
                searchController: searchController,
                onSearchChanged: (value) {
                  setState(() {
                    searchQuery = value.trim().toLowerCase();
                  });
                },
              ),
              const SliverToBoxAdapter(child: NearbyRequestsDivider()),

              if (isInitialLoading)
                const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(child: CircularProgressIndicator()),
                )
              else if (showEmptyState)
                const SliverFillRemaining(
                  hasScrollBody: false,
                  child: HomeEmptyState(),
                )
              else
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    if (index < requests.length) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: RequestCard(entity: requests[index]),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: Center(
                          child: isLoading
                              ? const CircularProgressIndicator()
                              : const SizedBox(),
                        ),
                      );
                    }
                  }, childCount: requests.length + (hasMore ? 1 : 0)),
                ),
            ],
          ),
        );
      },
    );
  }
}
