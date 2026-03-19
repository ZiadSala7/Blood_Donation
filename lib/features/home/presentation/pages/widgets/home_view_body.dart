import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../auth/login/presentation/cubit/login_cubit.dart';
import '../../../../auth/register/data/models/register_model.dart';
import '../../cubit/home_cubit.dart';
import '../../cubit/home_states.dart';
import 'home_view_body_content.dart';

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

  @override
  void initState() {
    super.initState();
    model = context.read<LoginCubit>().model!;
    scrollController = ScrollController();
    searchController = TextEditingController();
    scrollController.addListener(scrollListener);
  }

  void scrollListener() {
    if (!scrollController.hasClients || isLoading || !hasMore) return;

    final currentPosition = scrollController.position.pixels;
    final maxScroll = scrollController.position.maxScrollExtent;

    if (currentPosition >= maxScroll - 200) {
      _loadNextPage();
    }
  }

  void _checkIfNeedsPagination() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (!scrollController.hasClients || isLoading || !hasMore) return;

      final maxScroll = scrollController.position.maxScrollExtent;
      // Content doesn't fill the screen — load more immediately
      if (maxScroll <= 0) {
        _loadNextPage();
      }
    });
  }

  void _loadNextPage() {
    if (isLoading || !hasMore) return;
    setState(() => isLoading = true);
    context.read<HomeCubit>().getRequestsWithPagination(index: nextPage++);
  }

  Future<void> _onRefresh() async {
    setState(() {
      nextPage = 2;
      isLoading = false;
      hasMore = true;
    });
    await context.read<HomeCubit>().refreshRequests();
    _checkIfNeedsPagination();
  }

  Future<void> _onApplyFiltration(
    bool suitableRequests,
    int sortingOption,
    int? governorateId,
    int? cityId,
  ) async {
    setState(() {
      nextPage = 2;
      isLoading = false;
      hasMore = true;
    });
    await context.read<HomeCubit>().applyFiltration(
      suitableRequests: suitableRequests,
      sortingOption: sortingOption,
      governorateId: governorateId,
      cityId: cityId,
    );
    _checkIfNeedsPagination();
  }

  Future<void> _onSearchSubmitted(String value) async {
    final trimmed = value.trim();
    setState(() {
      nextPage = 2;
      isLoading = false;
      hasMore = true;
    });
    if (trimmed.length > 3) {
      await context.read<HomeCubit>().applySearch(trimmed);
    } else {
      await context.read<HomeCubit>().applySearch('');
    }
    _checkIfNeedsPagination();
  }

  Future<void> _onSearchChanged(String value) async {
    final trimmed = value.trim();
    setState(() {
      nextPage = 2;
      isLoading = false;
      hasMore = true;
    });
    if (trimmed.length > 3) {
      await context.read<HomeCubit>().applySearch(trimmed);
    } else {
      await context.read<HomeCubit>().applySearch('');
    }
    _checkIfNeedsPagination();
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
      listener: _onHomeStateChanged,
      builder: (context, state) => _buildBody(state),
    );
  }

  void _onHomeStateChanged(BuildContext context, HomeStates state) {
    if (state is HomeSuccess) {
      setState(() => isLoading = false);
      if (state.requestEntities.isEmpty) {
        setState(() => hasMore = false);
      } else {
        _checkIfNeedsPagination();
      }
    } else if (state is HomeFailure) {
      setState(() => isLoading = false);
    }
  }

  Widget _buildBody(HomeStates state) {
    final allRequests = context.read<HomeCubit>().allEntities;
    final requests = allRequests;
    final isInitialLoading = state is HomeLoading && allRequests.isEmpty;
    final showEmptyState = requests.isEmpty && !isInitialLoading;

    return HomeViewBodyContent(
      model: model,
      scrollController: scrollController,
      searchController: searchController,
      onSearchChanged: _onSearchChanged,
      onSearchSubmitted: _onSearchSubmitted,
      onApplyFiltration: _onApplyFiltration,
      onRefresh: _onRefresh,
      requests: requests,
      isInitialLoading: isInitialLoading,
      showEmptyState: showEmptyState,
      isLoading: isLoading,
      hasMore: hasMore,
    );
  }
}
