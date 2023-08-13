// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'yu_router.dart';

abstract class _$YURouter extends RootStackRouter {
  // ignore: unused_element
  _$YURouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AbsencesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AbsencesView(),
      );
    },
    AbsenceDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<AbsenceDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AbsenceDetailsView(
          key: args.key,
          absence: args.absence,
        ),
      );
    },
    StudentInfoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StudentInfoView(),
      );
    },
    NotificationsPermissionRoute.name: (routeData) {
      final args = routeData.argsAs<NotificationsPermissionRouteArgs>(
          orElse: () => const NotificationsPermissionRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NotificationsPermissionView(
          key: args.key,
          onPermissionGranted: args.onPermissionGranted,
          onDismissed: args.onDismissed,
        ),
      );
    },
    ScheduleBuilderRoute.name: (routeData) {
      final args = routeData.argsAs<ScheduleBuilderRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ScheduleBuilderView(
          key: args.key,
          offeredCourses: args.offeredCourses,
        ),
      );
    },
    OfferedCoursesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OfferedCoursesView(),
      );
    },
    CourseDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CourseDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CourseDetailsView(
          key: args.key,
          scheduleEntry: args.scheduleEntry,
        ),
      );
    },
    CoursesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CoursesView(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileView(),
      );
    },
    YuGptRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const YuGptView(),
      );
    },
    StartupRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StartupView(),
      );
    },
    MainRoute.name: (routeData) {
      final args =
          routeData.argsAs<MainRouteArgs>(orElse: () => const MainRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MainView(
          key: args.key,
          pages: args.pages,
        ),
      );
    },
    PaywallRoute.name: (routeData) {
      final args = routeData.argsAs<PaywallRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PaywallView(
          key: args.key,
          title: args.title,
          description: args.description,
          packages: args.packages,
          customerInfo: args.customerInfo,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginView(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingView(),
      );
    },
  };
}

/// generated route for
/// [AbsencesView]
class AbsencesRoute extends PageRouteInfo<void> {
  const AbsencesRoute({List<PageRouteInfo>? children})
      : super(
          AbsencesRoute.name,
          initialChildren: children,
        );

  static const String name = 'AbsencesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AbsenceDetailsView]
class AbsenceDetailsRoute extends PageRouteInfo<AbsenceDetailsRouteArgs> {
  AbsenceDetailsRoute({
    Key? key,
    required Absence absence,
    List<PageRouteInfo>? children,
  }) : super(
          AbsenceDetailsRoute.name,
          args: AbsenceDetailsRouteArgs(
            key: key,
            absence: absence,
          ),
          initialChildren: children,
        );

  static const String name = 'AbsenceDetailsRoute';

  static const PageInfo<AbsenceDetailsRouteArgs> page =
      PageInfo<AbsenceDetailsRouteArgs>(name);
}

class AbsenceDetailsRouteArgs {
  const AbsenceDetailsRouteArgs({
    this.key,
    required this.absence,
  });

  final Key? key;

  final Absence absence;

  @override
  String toString() {
    return 'AbsenceDetailsRouteArgs{key: $key, absence: $absence}';
  }
}

/// generated route for
/// [StudentInfoView]
class StudentInfoRoute extends PageRouteInfo<void> {
  const StudentInfoRoute({List<PageRouteInfo>? children})
      : super(
          StudentInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'StudentInfoRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NotificationsPermissionView]
class NotificationsPermissionRoute
    extends PageRouteInfo<NotificationsPermissionRouteArgs> {
  NotificationsPermissionRoute({
    Key? key,
    void Function()? onPermissionGranted,
    void Function()? onDismissed,
    List<PageRouteInfo>? children,
  }) : super(
          NotificationsPermissionRoute.name,
          args: NotificationsPermissionRouteArgs(
            key: key,
            onPermissionGranted: onPermissionGranted,
            onDismissed: onDismissed,
          ),
          initialChildren: children,
        );

  static const String name = 'NotificationsPermissionRoute';

  static const PageInfo<NotificationsPermissionRouteArgs> page =
      PageInfo<NotificationsPermissionRouteArgs>(name);
}

class NotificationsPermissionRouteArgs {
  const NotificationsPermissionRouteArgs({
    this.key,
    this.onPermissionGranted,
    this.onDismissed,
  });

  final Key? key;

  final void Function()? onPermissionGranted;

  final void Function()? onDismissed;

  @override
  String toString() {
    return 'NotificationsPermissionRouteArgs{key: $key, onPermissionGranted: $onPermissionGranted, onDismissed: $onDismissed}';
  }
}

/// generated route for
/// [ScheduleBuilderView]
class ScheduleBuilderRoute extends PageRouteInfo<ScheduleBuilderRouteArgs> {
  ScheduleBuilderRoute({
    Key? key,
    required List<OfferedCourse> offeredCourses,
    List<PageRouteInfo>? children,
  }) : super(
          ScheduleBuilderRoute.name,
          args: ScheduleBuilderRouteArgs(
            key: key,
            offeredCourses: offeredCourses,
          ),
          initialChildren: children,
        );

  static const String name = 'ScheduleBuilderRoute';

  static const PageInfo<ScheduleBuilderRouteArgs> page =
      PageInfo<ScheduleBuilderRouteArgs>(name);
}

class ScheduleBuilderRouteArgs {
  const ScheduleBuilderRouteArgs({
    this.key,
    required this.offeredCourses,
  });

  final Key? key;

  final List<OfferedCourse> offeredCourses;

  @override
  String toString() {
    return 'ScheduleBuilderRouteArgs{key: $key, offeredCourses: $offeredCourses}';
  }
}

/// generated route for
/// [OfferedCoursesView]
class OfferedCoursesRoute extends PageRouteInfo<void> {
  const OfferedCoursesRoute({List<PageRouteInfo>? children})
      : super(
          OfferedCoursesRoute.name,
          initialChildren: children,
        );

  static const String name = 'OfferedCoursesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CourseDetailsView]
class CourseDetailsRoute extends PageRouteInfo<CourseDetailsRouteArgs> {
  CourseDetailsRoute({
    Key? key,
    required ScheduleEntry scheduleEntry,
    List<PageRouteInfo>? children,
  }) : super(
          CourseDetailsRoute.name,
          args: CourseDetailsRouteArgs(
            key: key,
            scheduleEntry: scheduleEntry,
          ),
          initialChildren: children,
        );

  static const String name = 'CourseDetailsRoute';

  static const PageInfo<CourseDetailsRouteArgs> page =
      PageInfo<CourseDetailsRouteArgs>(name);
}

class CourseDetailsRouteArgs {
  const CourseDetailsRouteArgs({
    this.key,
    required this.scheduleEntry,
  });

  final Key? key;

  final ScheduleEntry scheduleEntry;

  @override
  String toString() {
    return 'CourseDetailsRouteArgs{key: $key, scheduleEntry: $scheduleEntry}';
  }
}

/// generated route for
/// [CoursesView]
class CoursesRoute extends PageRouteInfo<void> {
  const CoursesRoute({List<PageRouteInfo>? children})
      : super(
          CoursesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CoursesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileView]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [YuGptView]
class YuGptRoute extends PageRouteInfo<void> {
  const YuGptRoute({List<PageRouteInfo>? children})
      : super(
          YuGptRoute.name,
          initialChildren: children,
        );

  static const String name = 'YuGptRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StartupView]
class StartupRoute extends PageRouteInfo<void> {
  const StartupRoute({List<PageRouteInfo>? children})
      : super(
          StartupRoute.name,
          initialChildren: children,
        );

  static const String name = 'StartupRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainView]
class MainRoute extends PageRouteInfo<MainRouteArgs> {
  MainRoute({
    Key? key,
    List<Widget>? pages,
    List<PageRouteInfo>? children,
  }) : super(
          MainRoute.name,
          args: MainRouteArgs(
            key: key,
            pages: pages,
          ),
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<MainRouteArgs> page = PageInfo<MainRouteArgs>(name);
}

class MainRouteArgs {
  const MainRouteArgs({
    this.key,
    this.pages,
  });

  final Key? key;

  final List<Widget>? pages;

  @override
  String toString() {
    return 'MainRouteArgs{key: $key, pages: $pages}';
  }
}

/// generated route for
/// [PaywallView]
class PaywallRoute extends PageRouteInfo<PaywallRouteArgs> {
  PaywallRoute({
    Key? key,
    required String title,
    required String description,
    required List<Package> packages,
    required CustomerInfo customerInfo,
    List<PageRouteInfo>? children,
  }) : super(
          PaywallRoute.name,
          args: PaywallRouteArgs(
            key: key,
            title: title,
            description: description,
            packages: packages,
            customerInfo: customerInfo,
          ),
          initialChildren: children,
        );

  static const String name = 'PaywallRoute';

  static const PageInfo<PaywallRouteArgs> page =
      PageInfo<PaywallRouteArgs>(name);
}

class PaywallRouteArgs {
  const PaywallRouteArgs({
    this.key,
    required this.title,
    required this.description,
    required this.packages,
    required this.customerInfo,
  });

  final Key? key;

  final String title;

  final String description;

  final List<Package> packages;

  final CustomerInfo customerInfo;

  @override
  String toString() {
    return 'PaywallRouteArgs{key: $key, title: $title, description: $description, packages: $packages, customerInfo: $customerInfo}';
  }
}

/// generated route for
/// [LoginView]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingView]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
