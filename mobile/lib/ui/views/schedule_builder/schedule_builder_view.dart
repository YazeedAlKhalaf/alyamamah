import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/models/offered_course.dart';
import 'package:alyamamah/core/router/yu_router.dart';
import 'package:alyamamah/ui/views/courses/courses_schedule.dart';
import 'package:alyamamah/ui/views/courses/courses_view_model.dart';
import 'package:alyamamah/ui/views/courses/models/schedule_entry.dart';
import 'package:alyamamah/ui/views/schedule_builder/offered_courses_conflicts_view.dart';
import 'package:alyamamah/ui/views/schedule_builder/payment_required_bottom_sheet.dart';
import 'package:alyamamah/ui/views/schedule_builder/schedule_builder_view_model.dart';
import 'package:alyamamah/ui/views/schedule_builder/schedule_builder_view_state.dart';
import 'package:alyamamah/ui/widgets/button_loading.dart';
import 'package:alyamamah/ui/widgets/yu_show.dart';
import 'package:alyamamah/ui/widgets/yu_snack_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

@RoutePage()
class ScheduleBuilderView extends ConsumerStatefulWidget {
  final List<OfferedCourse> offeredCourses;
  final List<OfferedCourse> coursesToDelete;

  const ScheduleBuilderView({
    super.key,
    required this.offeredCourses,
    required this.coursesToDelete,
  });

  @override
  ConsumerState<ScheduleBuilderView> createState() =>
      _ScheduleBuilderViewState();
}

class _ScheduleBuilderViewState extends ConsumerState<ScheduleBuilderView> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();

    pageController = PageController();

    Future(() {
      ref
          .read(scheduleBuilderViewModelProvider.notifier)
          .generateSuggestedSchedules(
            selectedCourses: widget.offeredCourses,
          );
    });

    ref.listenManual(scheduleBuilderViewModelProvider, (
      ScheduleBuilderViewState? previous,
      ScheduleBuilderViewState current,
    ) async {
      if (previous == current) return;

      switch (current.status) {
        case ScheduleBuilderViewStatus.submitted:
          YUSnackBar.show(
            context,
            message: context.s
                .your_schedule_has_been_set_successfully__you_can_view_it_in_the_courses_tab,
          );

          ref.read(yuRouterProvider).popUntil(
                ModalRoute.withName(MainRoute.name),
              );
          break;
        case ScheduleBuilderViewStatus.paymentRequired:
          await YUShow.modalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return PaymentRequiredBottomSheet(
                paymentRequiredMessage: current.paymentRequiredMessage,
                onPaymentSuccess: () async {
                  ref.read(yuRouterProvider).popUntil(
                        ModalRoute.withName(ScheduleBuilderRoute.name),
                      );

                  await ref
                      .read(scheduleBuilderViewModelProvider.notifier)
                      .submitSchedule(
                        coursesToDelete: widget.coursesToDelete,
                      );
                },
                onPaymentFailure: () async {
                  ref.read(yuRouterProvider).popUntil(
                        ModalRoute.withName(ScheduleBuilderRoute.name),
                      );

                  YUSnackBar.show(
                    context,
                    message: context.s
                        .oops_it_looks_like_theres_a_problem_with_your_payment__please_confirm_your_payment_information_and_try_again,
                  );
                },
              );
            },
          );
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final scheduleBuilderViewState = ref.watch(
      scheduleBuilderViewModelProvider,
    );

    final allCoursesHaveConflicts = scheduleBuilderViewState
        .offeredCoursesSchedules
        .every((schedule) => schedule.hasConflicts);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            context.s.schedule_builder,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: switch (scheduleBuilderViewState.status) {
                ScheduleBuilderViewStatus.generating => const Center(
                    child: CircularProgressIndicator(),
                  ),
                _ => () {
                    if (allCoursesHaveConflicts) {
                      return Padding(
                        padding: const EdgeInsets.all(Constants.padding),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              '🤔',
                              textAlign: TextAlign.center,
                              style: context.textTheme.displayLarge,
                            ),
                            const SizedBox(height: Constants.spacing),
                            Text(
                              context.s
                                  .all_the_courses_that_you_have_selected_have_conflicts_please_remove_some_courses_and_try_again,
                              textAlign: TextAlign.center,
                              style: context.textTheme.titleMedium,
                            ),
                            const SizedBox(height: Constants.spacing),
                            FilledButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                context.s.go_back,
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return PageView.builder(
                      controller: pageController,
                      onPageChanged: (int pageIndex) {
                        ref
                            .read(scheduleBuilderViewModelProvider.notifier)
                            .setSelectedScheduleIndex(pageIndex);
                      },
                      itemCount: scheduleBuilderViewState
                          .offeredCoursesSchedules.length,
                      itemBuilder: (BuildContext context, int index) {
                        final offeredCoursesSchedule = scheduleBuilderViewState
                            .offeredCoursesSchedules[index];

                        if (offeredCoursesSchedule.hasConflicts) {
                          return OfferedCoursesConflictsView(
                            conflicts: offeredCoursesSchedule.conflicts,
                            offeredCourses: widget.offeredCourses,
                          );
                        }

                        return CoursesSchedule(
                          scheduleDays: offeredCoursesSchedule.scheduleDays,
                          onCourseTap: (ScheduleEntry scheduleEntry) async {
                            await ref
                                .read(coursesViewModelProvider)
                                .navigateToCourseDetails(scheduleEntry);
                          },
                          onRefresh: () async {},
                        );
                      },
                    );
                  }()
              },
            ),
            Container(
              color: ElevationOverlay.applySurfaceTint(
                context.colorScheme.surface,
                context.colorScheme.surfaceTint,
                3,
              ),
              width: double.infinity,
              child: Column(
                children: [
                  const SizedBox(height: Constants.padding),
                  SmoothPageIndicator(
                    controller: pageController,
                    count:
                        scheduleBuilderViewState.offeredCoursesSchedules.length,
                    effect: ScrollingDotsEffect(
                      activeDotColor: context.colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: switch (allCoursesHaveConflicts) {
          true => null,
          false => BottomAppBar(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FilledButton(
                    onPressed: switch (scheduleBuilderViewState.status) {
                      ScheduleBuilderViewStatus.submitting => null,
                      _ => () async {
                          await ref
                              .read(scheduleBuilderViewModelProvider.notifier)
                              .submitSchedule(
                                coursesToDelete: widget.coursesToDelete,
                              );
                        },
                    },
                    child: switch (scheduleBuilderViewState.status) {
                      ScheduleBuilderViewStatus.submitting =>
                        const ButtonLoading(),
                      ScheduleBuilderViewStatus.errorSubmitting => Text(
                          context.s.please_try_again,
                        ),
                      _ => Text(
                          context.s.choose_schedule,
                        ),
                    },
                  ),
                ],
              ),
            ),
        });
  }
}
