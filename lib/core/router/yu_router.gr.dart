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
import 'package:alyamamah/ui/views/startup/startup_view.dart' as _i1;
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

class YURouter extends _i4.RootStackRouter {
  YURouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    StartupRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.StartupView(),
        opaque: true,
      );
    },
    LoginRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.LoginView(),
        opaque: true,
      );
    },
    HomeRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeView(),
        opaque: true,
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          StartupRoute.name,
          path: '/',
        ),
        _i4.RouteConfig(
          LoginRoute.name,
          path: '/login-view',
        ),
        _i4.RouteConfig(
          HomeRoute.name,
          path: '/home-view',
        ),
      ];
}

/// generated route for
/// [_i1.StartupView]
class StartupRoute extends _i4.PageRouteInfo<void> {
  const StartupRoute()
      : super(
          StartupRoute.name,
          path: '/',
        );

  static const String name = 'StartupRoute';
}

/// generated route for
/// [_i2.LoginView]
class LoginRoute extends _i4.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login-view',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.HomeView]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home-view',
        );

  static const String name = 'HomeRoute';
}
