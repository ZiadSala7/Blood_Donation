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

  static const String registerName = 'register';
  static const String loginName = 'login';
  static const String btmNavBarName = 'btmNavBar';
  static const String homeName = 'home';
  static const String addRequestName = 'addRequest';

  static final appRouter = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(
        path: register,
        name: registerName,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: login,
        name: loginName,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: btmNavBar,
        name: btmNavBarName,
        builder: (context, state) {
          final tab =
              int.tryParse(state.uri.queryParameters['tab'] ?? '') ?? 0;
          return BottomNavBar(initialTab: tab.clamp(0, 3));
        },
      ),
      GoRoute(
        path: homeView,
        name: homeName,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: addRqust,
        name: addRequestName,
        builder: (context, state) => const AddRequestView(),
      ),
    ],
  );
}
