import 'package:go_router/go_router.dart';

import '../../features/add_request/presentation/pages/add_request_view.dart';
import '../../features/auth/login/presentation/pages/login_view.dart';
import '../../features/auth/register/presentation/pages/register_view.dart';
import '../../features/home/presentation/pages/home_view.dart';
import '../widgets/bottom_nav_bar.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRoutes {
  static const String register = '/register';
  static const String login = '/login';
  static const String btmNavBar = '/btmNavBar';
  static const String homeView = '/homeView';
  static const String addRqust = '/addRequest';
  static final appRouter = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(
        path: register,
        name: 'register',
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: login,
        name: 'login',
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: btmNavBar,
        name: 'btmNavBar',
        builder: (context, state) {
          final tab =
              int.tryParse(state.uri.queryParameters['tab'] ?? '') ?? 0;
          return BottomNavBar(initialTab: tab.clamp(0, 3));
        },
      ),
      GoRoute(
        path: homeView,
        name: 'home',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: addRqust,
        name: 'addRequest',
        builder: (context, state) => const AddRequestView(),
      ),
    ],
  );
}
