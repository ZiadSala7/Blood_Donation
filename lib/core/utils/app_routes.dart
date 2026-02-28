import 'package:go_router/go_router.dart';

import '../../features/add_request/presentation/pages/add_request_view.dart';
import '../../features/auth/change_password/presentation/screens/change_password_view.dart';
import '../../features/auth/forget_password/presentation/screens/forget_view.dart';
import '../../features/auth/login/presentation/pages/login_view.dart';
import '../../features/auth/otp_verification/presentation/screens/otp_verification_view.dart';
import '../../features/auth/register/presentation/pages/register_view.dart';
import '../../features/auth/reset_password/presentation/screens/reset_passwod_view.dart';
import '../../features/home/data/models/request_model.dart';
import '../../features/home/presentation/pages/home_view.dart';
import '../../features/request_details/presentation/pages/request_details_view.dart';
import '../widgets/bottom_nav_bar.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRoutes {
  static const String register = '/register';
  static const String login = '/login';
  static const String btmNavBar = '/btmNavBar';
  static const String homeView = '/homeView';
  static const String addRqust = '/addRequest';
  static const String forgPassword = '/forgetPassword';
  static const String otpVerification = '/otpVerificaion';
  static const String resetPassView = '/resetPassView';
  static const String changePass = '/changePassword';
  static const String requestDetails = '/requestDetails';

  static const String registerName = 'register';
  static const String loginName = 'login';
  static const String btmNavBarName = 'btmNavBar';
  static const String homeName = 'home';
  static const String addRequestName = 'addRequest';
  static const String forgPasswordName = 'forgetPassword';
  static const String otpVerificationName = 'otpVerificaion';
  static const String resetPasswordName = 'resetPasswordName';
  static const String changePassName = 'changePasswordName';
  static const String requestDetailsName = 'requestDetailsName';

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
        builder: (context, state) {
          final extra = state.extra;
          final showResetSuccessDialog =
              extra is Map<String, dynamic> &&
              extra['showResetSuccessDialog'] == true;
          final showRegisterSuccessDialog =
              extra is Map<String, dynamic> &&
              extra['showRegisterSuccessDialog'] == true;
          return LoginView(
            showResetSuccessDialog: showResetSuccessDialog,
            showRegisterSuccessDialog: showRegisterSuccessDialog,
          );
        },
      ),
      GoRoute(
        path: btmNavBar,
        name: btmNavBarName,
        builder: (context, state) {
          final tab = int.tryParse(state.uri.queryParameters['tab'] ?? '') ?? 0;
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
      GoRoute(
        path: forgPassword,
        name: forgPasswordName,
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: otpVerification,
        name: otpVerificationName,
        builder: (context, state) =>
            OtpVerificationView(email: state.extra as String),
      ),
      GoRoute(
        path: resetPassView,
        name: resetPasswordName,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return ResetPasswodView(
            resetToken: data['resetToken'] as String,
            email: data['email'] as String,
          );
        },
      ),
      GoRoute(
        path: changePass,
        name: changePassName,
        builder: (context, state) => const ChangePasswordView(),
      ),
      GoRoute(
        path: requestDetails,
        name: requestDetailsName,
        builder: (context, state) =>
            RequestDetailsView(model: state.extra as RequestModel),
      ),
    ],
  );
}
