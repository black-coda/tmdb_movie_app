import 'package:go_router/go_router.dart';

import '../auth/view/screens/register_screen.dart';
import '../onboard/view/screen/splash.dart';

class RouteManager {
  static const String loginView = '/login';
  static const String dashboardView = '/list';
  static const String createView = '/create';
  static const String onboardView = '/';
  static const String logoutView = '/logout';
  static const String registerView = '/register';

  static final route = GoRouter(
    routes: [
      //* Onboard screen
      GoRoute(
        path: onboardView,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: registerView,
        builder: (context, state) => const RegisterScreen(),
      )
    ],
  );
}
