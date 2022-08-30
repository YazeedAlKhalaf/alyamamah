import 'package:alyamamah/login/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter getGoRouter({
    required bool showSplashScreen,
    required bool loggedIn,
  }) {
    final goRouter = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/splash',
          builder: (BuildContext context, GoRouterState state) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const Scaffold(body: Center(child: Text('main page')));
          },
        ),
        GoRoute(
          path: '/login',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginPage();
          },
        ),
      ],
      redirect: (GoRouterState state) {
        if (showSplashScreen) return '/splash';

        final loggingIn = state.subloc == '/login';
        if (!loggedIn) {
          return loggingIn ? null : '/login';
        }

        return null;
      },
    );

    return goRouter;
  }
}
