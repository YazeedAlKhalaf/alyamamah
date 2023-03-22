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
import 'package:alyamamah/core/models/absence.dart' as _i11;
import 'package:alyamamah/ui/views/absences/absence_details_view.dart' as _i8;
import 'package:alyamamah/ui/views/courses/courses_view.dart' as _i3;
import 'package:alyamamah/ui/views/login/login_view.dart' as _i2;
import 'package:alyamamah/ui/views/main/main_view.dart' as _i4;
import 'package:alyamamah/ui/views/onboarding/onboarding_view.dart' as _i7;
import 'package:alyamamah/ui/views/profile/profile_view.dart' as _i5;
import 'package:alyamamah/ui/views/startup/startup_view.dart' as _i1;
import 'package:alyamamah/ui/views/student_info/student_info_view.dart' as _i6;
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

class YURouter extends _i9.RootStackRouter {
  YURouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    StartupRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.StartupView(),
        opaque: true,
      );
    },
    LoginRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.LoginView(),
        opaque: true,
      );
    },
    CoursesRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.CoursesView(),
        opaque: true,
      );
    },
    MainRoute.name: (routeData) {
      final args =
          routeData.argsAs<MainRouteArgs>(orElse: () => const MainRouteArgs());
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i4.MainView(
          key: args.key,
          pages: args.pages,
        ),
        opaque: true,
      );
    },
    ProfileRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.ProfileView(),
        opaque: true,
      );
    },
    StudentInfoRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.StudentInfoView(),
        opaque: true,
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.OnboardingView(),
        opaque: true,
      );
    },
    AbsenceDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<AbsenceDetailsRouteArgs>();
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i8.AbsenceDetailsView(
          key: args.key,
          absence: args.absence,
        ),
        opaque: true,
      );
    },
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(
          StartupRoute.name,
          path: '/',
        ),
        _i9.RouteConfig(
          LoginRoute.name,
          path: '/login-view',
        ),
        _i9.RouteConfig(
          CoursesRoute.name,
          path: '/courses-view',
        ),
        _i9.RouteConfig(
          MainRoute.name,
          path: '/main-view',
        ),
        _i9.RouteConfig(
          ProfileRoute.name,
          path: '/profile-view',
        ),
        _i9.RouteConfig(
          StudentInfoRoute.name,
          path: '/student-info-view',
        ),
        _i9.RouteConfig(
          OnboardingRoute.name,
          path: '/onboarding-view',
        ),
        _i9.RouteConfig(
          AbsenceDetailsRoute.name,
          path: '/absence-details-view',
        ),
      ];
}

/// generated route for
/// [_i1.StartupView]
class StartupRoute extends _i9.PageRouteInfo<void> {
  const StartupRoute()
      : super(
          StartupRoute.name,
          path: '/',
        );

  static const String name = 'StartupRoute';
}

/// generated route for
/// [_i2.LoginView]
class LoginRoute extends _i9.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login-view',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.CoursesView]
class CoursesRoute extends _i9.PageRouteInfo<void> {
  const CoursesRoute()
      : super(
          CoursesRoute.name,
          path: '/courses-view',
        );

  static const String name = 'CoursesRoute';
}

/// generated route for
/// [_i4.MainView]
class MainRoute extends _i9.PageRouteInfo<MainRouteArgs> {
  MainRoute({
    _i10.Key? key,
    List<_i10.Widget>? pages,
  }) : super(
          MainRoute.name,
          path: '/main-view',
          args: MainRouteArgs(
            key: key,
            pages: pages,
          ),
        );

  static const String name = 'MainRoute';
}

class MainRouteArgs {
  const MainRouteArgs({
    this.key,
    this.pages,
  });

  final _i10.Key? key;

  final List<_i10.Widget>? pages;

  @override
  String toString() {
    return 'MainRouteArgs{key: $key, pages: $pages}';
  }
}

/// generated route for
/// [_i5.ProfileView]
class ProfileRoute extends _i9.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '/profile-view',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i6.StudentInfoView]
class StudentInfoRoute extends _i9.PageRouteInfo<void> {
  const StudentInfoRoute()
      : super(
          StudentInfoRoute.name,
          path: '/student-info-view',
        );

  static const String name = 'StudentInfoRoute';
}

/// generated route for
/// [_i7.OnboardingView]
class OnboardingRoute extends _i9.PageRouteInfo<void> {
  const OnboardingRoute()
      : super(
          OnboardingRoute.name,
          path: '/onboarding-view',
        );

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [_i8.AbsenceDetailsView]
class AbsenceDetailsRoute extends _i9.PageRouteInfo<AbsenceDetailsRouteArgs> {
  AbsenceDetailsRoute({
    _i10.Key? key,
    required _i11.Absence absence,
  }) : super(
          AbsenceDetailsRoute.name,
          path: '/absence-details-view',
          args: AbsenceDetailsRouteArgs(
            key: key,
            absence: absence,
          ),
        );

  static const String name = 'AbsenceDetailsRoute';
}

class AbsenceDetailsRouteArgs {
  const AbsenceDetailsRouteArgs({
    this.key,
    required this.absence,
  });

  final _i10.Key? key;

  final _i11.Absence absence;

  @override
  String toString() {
    return 'AbsenceDetailsRouteArgs{key: $key, absence: $absence}';
  }
}
