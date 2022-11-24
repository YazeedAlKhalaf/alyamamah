import 'package:alyamamah/login/view/login_page.dart';
import 'package:alyamamah/main/view/main_page.dart';
import 'package:alyamamah/my_schedule/view/my_schedule_page.dart';
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
        GoRoute(
          path: '/my-schedule',
          builder: (BuildContext context, GoRouterState state) {
            return const MySchedulePage();
          },
        ),
      ],
      redirect: (BuildContext context, GoRouterState state) {
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
