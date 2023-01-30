// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:alyamamah/ui/views/home/home_view.dart' as _i3;
import 'package:alyamamah/ui/views/login/login_view.dart' as _i2;
import 'package:alyamamah/ui/views/main/main_view.dart' as _i4;
import 'package:alyamamah/ui/views/profile/profile_view.dart' as _i5;
import 'package:alyamamah/ui/views/startup/startup_view.dart' as _i1;
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

class YURouter extends _i6.RootStackRouter {
  YURouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    StartupRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.StartupView(),
        opaque: true,
      );
    },
    LoginRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.LoginView(),
        opaque: true,
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeView(),
        opaque: true,
      );
    },
    MainRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.MainView(),
        opaque: true,
      );
    },
    ProfileRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.ProfileView(),
        opaque: true,
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          StartupRoute.name,
          path: '/',
        ),
        _i6.RouteConfig(
          LoginRoute.name,
          path: '/login-view',
        ),
        _i6.RouteConfig(
          HomeRoute.name,
          path: '/home-view',
        ),
        _i6.RouteConfig(
          MainRoute.name,
          path: '/main-view',
        ),
        _i6.RouteConfig(
          ProfileRoute.name,
          path: '/profile-view',
        ),
      ];
}

/// generated route for
/// [_i1.StartupView]
class StartupRoute extends _i6.PageRouteInfo<void> {
  const StartupRoute()
      : super(
          StartupRoute.name,
          path: '/',
        );

  static const String name = 'StartupRoute';
}

/// generated route for
/// [_i2.LoginView]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login-view',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.HomeView]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home-view',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.MainView]
class MainRoute extends _i6.PageRouteInfo<void> {
  const MainRoute()
      : super(
          MainRoute.name,
          path: '/main-view',
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i5.ProfileView]
class ProfileRoute extends _i6.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '/profile-view',
        );

  static const String name = 'ProfileRoute';
}
