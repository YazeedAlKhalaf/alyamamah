import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/extensions/map_day_schedule_entries.dart';
import 'package:alyamamah/ui/views/courses/change_semester_bottom_sheet.dart';
import 'package:alyamamah/ui/views/courses/courses_schedule.dart';
import 'package:alyamamah/ui/views/courses/courses_schedule_empty.dart';
import 'package:alyamamah/ui/views/courses/courses_view_model.dart';
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
        title: Text(context.s.my_courses),
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
                return const ChangeSemesterBottomSheet();
              },
            );
          },
        ),
        actions: const [
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
        ],
      ),
      body: SafeArea(
        child: coursesViewModel.isBusy
            ? const Center(child: CircularProgressIndicator())
            : coursesViewModel.scheduleDays.isAllDaysEmpty
                ? const CoursesScheduleEmpty()
                : CoursesSchedule(
                    scheduleDays: coursesViewModel.scheduleDays,
                    startHour: lowestStartHour,
                    cellHeight: coursesViewModel.isRamadan ? 90 : 60,
                    onCourseTap: (onCourseTap) async {
                      await ref
                          .read(coursesViewModelProvider)
                          .navigateToCourseDetails(onCourseTap);
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
