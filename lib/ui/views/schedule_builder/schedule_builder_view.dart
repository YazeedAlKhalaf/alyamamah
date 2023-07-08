import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/models/offered_course.dart';
import 'package:alyamamah/core/router/yu_router.dart';
import 'package:alyamamah/ui/views/courses/courses_schedule.dart';
import 'package:alyamamah/ui/views/courses/models/schedule_entry.dart';
import 'package:alyamamah/ui/views/schedule_builder/offered_courses_conflicts_view.dart';
import 'package:alyamamah/ui/views/schedule_builder/payment_required_bottom_sheet.dart';
import 'package:alyamamah/ui/views/schedule_builder/schedule_builder_view_model.dart';
import 'package:alyamamah/ui/views/schedule_builder/schedule_builder_view_state.dart';
import 'package:alyamamah/ui/widgets/yu_show.dart';
import 'package:alyamamah/ui/widgets/yu_snack_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class ScheduleBuilderView extends ConsumerStatefulWidget {
  final List<OfferedCourse> offeredCourses;

  const ScheduleBuilderView({
    super.key,
    required this.offeredCourses,
  });

  @override
  ConsumerState<ScheduleBuilderView> createState() =>
      _ScheduleBuilderViewState();
}

class _ScheduleBuilderViewState extends ConsumerState<ScheduleBuilderView> {
  @override
  void initState() {
    super.initState();

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
                      .submitSchedule();
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

    return Scaffold(
      appBar: AppBar(
        title: Text(context.s.schedule_builder),
      ),
      body: PageView.builder(
        onPageChanged: (int pageIndex) {
          ref
              .read(scheduleBuilderViewModelProvider.notifier)
              .setSelectedScheduleIndex(pageIndex);
        },
        itemCount: scheduleBuilderViewState.offeredCoursesSchedules.length,
        itemBuilder: (BuildContext context, int index) {
          final offeredCoursesSchedule =
              scheduleBuilderViewState.offeredCoursesSchedules[index];

          if (offeredCoursesSchedule.hasConflicts) {
            return OfferedCoursesConflictsView(
              conflicts: offeredCoursesSchedule.conflicts,
              offeredCourses: widget.offeredCourses,
            );
          }

          return CoursesSchedule(
            scheduleDays: offeredCoursesSchedule.scheduleDays,
            onCourseTap: (ScheduleEntry scheduleEntry) {},
            onRefresh: () async {},
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FilledButton(
              onPressed: switch (scheduleBuilderViewState.status) {
                ScheduleBuilderViewStatus.submitting => null,
                _ => () async {
                    await ref
                        .read(scheduleBuilderViewModelProvider.notifier)
                        .submitSchedule();
                  },
              },
              child: switch (scheduleBuilderViewState.status) {
                ScheduleBuilderViewStatus.submitting => const Center(
                    child: CircularProgressIndicator(),
                  ),
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
    );
  }
}
