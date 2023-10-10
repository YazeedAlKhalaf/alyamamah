import 'package:alyamamah/core/models/absence.dart';
import 'package:alyamamah/core/models/offered_course.dart';
import 'package:alyamamah/ui/views/absences/absence_details_view.dart';
import 'package:alyamamah/ui/views/absences/absences_view.dart';
import 'package:alyamamah/ui/views/courses/course_details_view.dart';
import 'package:alyamamah/ui/views/courses/courses_view.dart';
import 'package:alyamamah/ui/views/courses/models/schedule_entry.dart';
import 'package:alyamamah/ui/views/feedback/feedback_view.dart';
import 'package:alyamamah/ui/views/login/login_view.dart';
import 'package:alyamamah/ui/views/main/main_view.dart';
import 'package:alyamamah/ui/views/onboarding/onboarding_view.dart';
import 'package:alyamamah/ui/views/permissions/notification_permission_view.dart';
import 'package:alyamamah/ui/views/profile/profile_view.dart';
import 'package:alyamamah/ui/views/schedule_builder/offered_courses_view.dart';
import 'package:alyamamah/ui/views/schedule_builder/schedule_builder_view.dart';
import 'package:alyamamah/ui/views/startup/startup_view.dart';
import 'package:alyamamah/ui/views/student_info/student_info_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'yu_router.gr.dart';

final yuRouterProvider = Provider<YURouter>((ref) => YURouter());

@AutoRouterConfig(
  replaceInRouteName: 'View,Route',
)
class YURouter extends _$YURouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: StartupRoute.page, path: '/'),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: CoursesRoute.page),
    AutoRoute(page: MainRoute.page),
    AutoRoute(page: ProfileRoute.page),
    AutoRoute(page: StudentInfoRoute.page),
    AutoRoute(page: OnboardingRoute.page),
    AutoRoute(page: AbsenceDetailsRoute.page),
    AutoRoute(page: CourseDetailsRoute.page),
    CustomRoute(
      page: NotificationsPermissionRoute.page,
      transitionsBuilder: TransitionsBuilders.slideBottom,
      fullscreenDialog: true,
    ),
    AutoRoute(page: OfferedCoursesRoute.page),
    AutoRoute(page: ScheduleBuilderRoute.page),
    AutoRoute(page: FeedbackRoute.page),
  ];
}
