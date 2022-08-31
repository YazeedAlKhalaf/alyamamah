import 'package:alyamamah/login/view/login_page.dart';
import 'package:alyamamah/main/view/main_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter getGoRouter({
    required bool loggedIn,
  }) {
    final goRouter = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const MainPage();
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
