import 'package:alyamamah/ui/views/absences/absence_details_view.dart';
import 'package:alyamamah/ui/views/courses/courses_view.dart';
import 'package:alyamamah/ui/views/login/login_view.dart';
import 'package:alyamamah/ui/views/main/main_view.dart';
import 'package:alyamamah/ui/views/onboarding/onboarding_view.dart';
import 'package:alyamamah/ui/views/profile/profile_view.dart';
import 'package:alyamamah/ui/views/startup/startup_view.dart';
import 'package:alyamamah/ui/views/student_info/student_info_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'yu_router.gr.dart';

export 'yu_router.gr.dart';

final yuRouterProvider = Provider<YURouter>((ref) => YURouter());

@AdaptiveAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: [
    AdaptiveRoute(page: StartupView, initial: true),
    AdaptiveRoute(page: LoginView),
    AdaptiveRoute(page: CoursesView),
    AdaptiveRoute(page: MainView),
    AdaptiveRoute(page: ProfileView),
    AdaptiveRoute(page: StudentInfoView),
    AdaptiveRoute(page: OnboardingView),
    AdaptiveRoute(page: AbsenceDetailsView),
  ],
)
class $YURouter {}
