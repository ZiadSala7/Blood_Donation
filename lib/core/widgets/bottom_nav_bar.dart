import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../api/dio_consumer.dart';
import '../di/injection.dart';
import '../../features/home/data/repo/home_repo_impl.dart';
import '../../features/home/presentation/cubit/home_cubit.dart';
import '../../features/home/presentation/pages/home_view.dart';
import '../../features/notifications/presentation/pages/notifications_view.dart';
import '../../features/profile/presentation/pages/profile_view.dart';
import '../utils/app_colors.dart';

class BottomNavBar extends StatefulWidget {
  final int initialTab;

  const BottomNavBar({super.key, this.initialTab = 0});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialTab.clamp(0, 3);
  }

  @override
  void didUpdateWidget(BottomNavBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialTab != widget.initialTab) {
      _selectedIndex = widget.initialTab.clamp(0, 3);
    }
  }

  final List<Widget> _pages = [
    const HomeView(),
    const Center(child: Text('الطلبات', style: TextStyle(fontSize: 24))),
    const NotificationsView(),
    const ProfileView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
        HomeRepoImpl(dio: getIt.get<DioConsumer>()),
      )..getRequestsWithPagination(),
      child: Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: _pages[_selectedIndex],
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(30),
          ),
          onPressed: () {
            // Add action
            GoRouter.of(context).pushNamed('addRequest');
          },
          backgroundColor: AppColors.commonClr,
          child: const Icon(Icons.add, size: 32, color: AppColors.white),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          color: Colors.white,
          elevation: 8,
          child: Container(
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(0, Symbols.home, 'الرئيسية'),
                _buildNavItem(1, Symbols.checklist, 'الطلبات'),
                const SizedBox(width: 40), // Space for FAB
                _buildNavItem(2, Symbols.notifications, 'الإشعارات'),
                _buildNavItem(3, Symbols.person, 'الحساب'),
              ],
            ),
          ),
        ),
      ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = _selectedIndex == index;
    return Expanded(
      child: InkWell(
        onTap: () => _onItemTapped(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.commonClr : Colors.grey,
              size: 26,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? AppColors.commonClr : Colors.grey,
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
