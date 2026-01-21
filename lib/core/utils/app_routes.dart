import 'package:go_router/go_router.dart';

import '../../features/auth/login/data/views/login_view.dart';
import '../../features/auth/register/presentation/views/register_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRoutes {
  static const String register = '/register';
  static const String login = '/login';
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
    ],
  );
}
