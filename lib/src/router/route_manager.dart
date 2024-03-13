import 'package:go_router/go_router.dart';

import '../onboard/view/screen/splash.dart';

class RouteManager {
  static const String loginView = '/login';
  static const String dashboardView = '/list';
  static const String createView = '/create';
  static const String updateView = '/create';
  static const String logoutView = '/logout';

  static final route = GoRouter(
    routes: [
      GoRoute(path: '/', 
      builder: (context, state) => const SplashScreen(),
      )
    ],

  );
}