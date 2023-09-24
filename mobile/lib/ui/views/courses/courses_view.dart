import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/extensions/map_day_schedule_entries.dart';
import 'package:alyamamah/core/providers/feature_flags/feature_flags_state_notifier.dart';
import 'package:alyamamah/core/router/yu_router.dart';
import 'package:alyamamah/core/utils.dart';
import 'package:alyamamah/ui/views/courses/courses_schedule.dart';
import 'package:alyamamah/ui/views/courses/courses_view_model.dart';
import 'package:alyamamah/ui/widgets/change_semester_bottom_sheet.dart';
import 'package:alyamamah/ui/widgets/empty_view.dart';
import 'package:alyamamah/ui/widgets/yu_show.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class CoursesView extends ConsumerStatefulWidget {
  const CoursesView({super.key});

  @override
  ConsumerState<CoursesView> createState() => _CoursesViewState();
}

class _CoursesViewState extends ConsumerState<CoursesView> {
  @override
  void initState() {
    super.initState();
    Future(() async {
      await ref.read(coursesViewModelProvider).getStudentSchedule();
    });
  }

  TextStyle todayDayStyle(bool isToday) {
    return TextStyle(
      color: isToday ? null : Theme.of(context).colorScheme.outlineVariant,
      fontWeight: isToday ? FontWeight.bold : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    final coursesViewModel = ref.watch(coursesViewModelProvider);
    final featureFlagsState = ref.watch(featureFlagsStateNotifierProvider);

    int lowestStartHour = 10000000000000;
    for (final e in coursesViewModel.scheduleDays.entries) {
      for (final e2 in e.value) {
        if (e2.startTime.hour < lowestStartHour) {
          lowestStartHour = e2.startTime.hour;
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.s.my_courses,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        surfaceTintColor: Theme.of(context).colorScheme.surface,
        leading: IconButton(
          icon: Text(
            '📚',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          onPressed: () async {
            await YUShow.modalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return ChangeSemesterBottomSheet(
                  selectedSemester: coursesViewModel.selectedSemester,
                  onSemesterChanged: (String semester) async {
                    ref.read(coursesViewModelProvider).changeSemester(semester);
                  },
                );
              },
            );
          },
        ),
        actions: [
          // TODO: add this back when ramadan comes back.
          // IconButton(
          //   icon: Text(
          //     coursesViewModel.isRamadan
          //         ? '🥘 ${context.s.regular}'
          //         : '📿 ${context.s.ramadan}',
          //     style: Theme.of(context).textTheme.bodyMedium,
          //   ),
          //   onPressed: () async {
          //     await ref.read(coursesViewModelProvider).toggleRamadanMode();
          //   },
          // ),
          if (featureFlagsState.isScheduleBuilderEnabled)
            IconButton(
              icon: const Icon(Icons.edit_calendar_rounded),
              onPressed: () {
                ref.read(yuRouterProvider).push(const OfferedCoursesRoute());
              },
            ),
        ],
      ),
      body: SafeArea(
        child: coursesViewModel.isBusy
            ? const Center(child: CircularProgressIndicator())
            : coursesViewModel.scheduleDays.isAllDaysEmpty
                ? EmptyView(
                    title: context.s.this_semester_has_no_courses_yet,
                    subtitle: Utils.semesterToReadable(
                      context,
                      coursesViewModel.selectedSemester,
                    ),
                    action: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        FilledButton.icon(
                          onPressed: () async {
                            await YUShow.modalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (BuildContext context) {
                                return ChangeSemesterBottomSheet(
                                  selectedSemester:
                                      coursesViewModel.selectedSemester,
                                  onSemesterChanged: (String semester) async {
                                    ref
                                        .read(coursesViewModelProvider)
                                        .changeSemester(semester);
                                  },
                                );
                              },
                            );
                          },
                          icon: const Icon(Icons.book_rounded),
                          label: Text(context.s.choose_semester),
                        ),
                        if (featureFlagsState.isScheduleBuilderEnabled)
                          FilledButton.tonalIcon(
                            onPressed: () async {
                              await ref
                                  .read(yuRouterProvider)
                                  .push(const OfferedCoursesRoute());
                            },
                            icon: const Icon(Icons.calendar_month_rounded),
                            label: Text(context.s.build_my_schedule),
                          ),
                      ],
                    ),
                    onRefresh: () async {
                      await coursesViewModel.getStudentSchedule();
                    },
                  )
                : CoursesSchedule(
                    scheduleDays: coursesViewModel.scheduleDays,
                    startHour: lowestStartHour,
                    cellHeight: coursesViewModel.isRamadan ? 90 : 60,
                    onCourseTap: (scheduleEntry) async {
                      await ref
                          .read(coursesViewModelProvider)
                          .navigateToCourseDetails(scheduleEntry);
                    },
                    onRefresh: () async {
                      await ref
                          .read(coursesViewModelProvider)
                          .getStudentSchedule();
                    },
                  ),
      ),
    );
  }
}
