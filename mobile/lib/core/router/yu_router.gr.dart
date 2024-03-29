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
    AbsencesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AbsencesView(),
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
    FeedbackListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FeedbackListView(),
      );
    },
    FeedbackRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FeedbackView(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginView(),
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
    OfferedCoursesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OfferedCoursesView(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingView(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileView(),
      );
    },
    ScheduleBuilderIntroRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScheduleBuilderIntroView(),
      );
    },
    ScheduleBuilderRoute.name: (routeData) {
      final args = routeData.argsAs<ScheduleBuilderRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ScheduleBuilderView(
          key: args.key,
          offeredCourses: args.offeredCourses,
          coursesToDelete: args.coursesToDelete,
        ),
      );
    },
    StartupRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StartupView(),
      );
    },
    StudentInfoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StudentInfoView(),
      );
    },
  };
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
/// [FeedbackListView]
class FeedbackListRoute extends PageRouteInfo<void> {
  const FeedbackListRoute({List<PageRouteInfo>? children})
      : super(
          FeedbackListRoute.name,
          initialChildren: children,
        );

  static const String name = 'FeedbackListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FeedbackView]
class FeedbackRoute extends PageRouteInfo<void> {
  const FeedbackRoute({List<PageRouteInfo>? children})
      : super(
          FeedbackRoute.name,
          initialChildren: children,
        );

  static const String name = 'FeedbackRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
/// [ScheduleBuilderIntroView]
class ScheduleBuilderIntroRoute extends PageRouteInfo<void> {
  const ScheduleBuilderIntroRoute({List<PageRouteInfo>? children})
      : super(
          ScheduleBuilderIntroRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScheduleBuilderIntroRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScheduleBuilderView]
class ScheduleBuilderRoute extends PageRouteInfo<ScheduleBuilderRouteArgs> {
  ScheduleBuilderRoute({
    Key? key,
    required List<OfferedCourse> offeredCourses,
    required List<OfferedCourse> coursesToDelete,
    List<PageRouteInfo>? children,
  }) : super(
          ScheduleBuilderRoute.name,
          args: ScheduleBuilderRouteArgs(
            key: key,
            offeredCourses: offeredCourses,
            coursesToDelete: coursesToDelete,
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
    required this.coursesToDelete,
  });

  final Key? key;

  final List<OfferedCourse> offeredCourses;

  final List<OfferedCourse> coursesToDelete;

  @override
  String toString() {
    return 'ScheduleBuilderRouteArgs{key: $key, offeredCourses: $offeredCourses, coursesToDelete: $coursesToDelete}';
  }
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
