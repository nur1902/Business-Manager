import 'package:go_router/go_router.dart';

import '../../providers/auth_provider.dart';
import '../../screens/auth/login_screen.dart';
import '../../screens/home/home_shell.dart';
import '../../screens/splash/splash_screen.dart';

class AppRoutes {
  AppRoutes._();
  static const splash = '/splash';
  static const login = '/login';
  static const home = '/home';
}

/// The router redirects automatically whenever the login state changes:
/// unknown -> splash, logged out -> login, logged in -> home.
GoRouter buildRouter(AuthProvider auth) {
  return GoRouter(
    initialLocation: AppRoutes.splash,
    refreshListenable: auth,
    redirect: (context, state) {
      final location = state.matchedLocation;
      switch (auth.status) {
        case AuthStatus.unknown:
          return location == AppRoutes.splash ? null : AppRoutes.splash;
        case AuthStatus.unauthenticated:
          return location == AppRoutes.login ? null : AppRoutes.login;
        case AuthStatus.authenticated:
          final onEntryScreen =
              location == AppRoutes.splash || location == AppRoutes.login;
          return onEntryScreen ? AppRoutes.home : null;
      }
    },
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomeShell(),
      ),
    ],
  );
}
