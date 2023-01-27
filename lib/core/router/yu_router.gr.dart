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
import 'package:alyamamah/ui/views/login/login_view.dart' as _i2;
import 'package:alyamamah/ui/views/startup/startup_view.dart' as _i1;
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

class YURouter extends _i3.RootStackRouter {
  YURouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    StartupRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.StartupView(),
        opaque: true,
      );
    },
    LoginRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.LoginView(),
        opaque: true,
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          StartupRoute.name,
          path: '/',
        ),
        _i3.RouteConfig(
          LoginRoute.name,
          path: '/login-view',
        ),
      ];
}

/// generated route for
/// [_i1.StartupView]
class StartupRoute extends _i3.PageRouteInfo<void> {
  const StartupRoute()
      : super(
          StartupRoute.name,
          path: '/',
        );

  static const String name = 'StartupRoute';
}

/// generated route for
/// [_i2.LoginView]
class LoginRoute extends _i3.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login-view',
        );

  static const String name = 'LoginRoute';
}
