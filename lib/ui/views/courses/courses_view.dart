import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/extensions/int.dart';
import 'package:alyamamah/core/extensions/time_of_day.dart';
import 'package:alyamamah/core/models/day.dart';
import 'package:alyamamah/ui/views/courses/courses_view_model.dart';
import 'package:alyamamah/ui/widgets/time_planner/time_planner.dart';
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

    final timePlannerTasks = <TimePlannerTask>[];
    int? lowestStartHour;
    int? highestEndHour;
    for (final e in coursesViewModel.scheduleDays.entries) {
      for (final e2 in e.value) {
        if (e2.startTime.hour < (lowestStartHour ?? 1000)) {
          lowestStartHour = e2.startTime.hour;
        }

        if (e2.endTime.hour > (highestEndHour ?? 0)) {
          highestEndHour = e2.endTime.hour;
        }

        timePlannerTasks.add(TimePlannerTask(
          minutesDuration: e2.startTime.difference(e2.endTime).inMinutes.abs(),
          dateTime: TimePlannerDateTime(
            day: e.key.index,
            hour: e2.startTime.hour,
            minutes: e2.startTime.minute,
          ),
          onTap: () async {
            await ref
                .read(coursesViewModelProvider)
                .navigateToCourseDetails(e2);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Spacer(),
              Text(
                e2.startTime.format(context),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const Spacer(flex: 8),
              Text(
                e2.courseCode,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              Text(
                e2.room,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              const Spacer(flex: 8),
              Text(
                e2.endTime.format(context),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const Spacer(),
            ],
          ),
        ));
      }
    }

    final today = DateTime.now().weekday.mapToDay();

    return Scaffold(
      appBar: AppBar(
        title: Text(context.s.my_courses),
        surfaceTintColor: Theme.of(context).colorScheme.surface,
        actions: [
          IconButton(
            icon: Text(
              coursesViewModel.isRamadan
                  ? '🥘 ${context.s.regular}'
                  : '📿 ${context.s.ramadan}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            onPressed: () async {
              await ref.read(coursesViewModelProvider).toggleRamadanMode();
            },
          ),
        ],
        flexibleSpace: coursesViewModel.isRamadan
            ? Opacity(
                opacity: 0.01,
                child: Image.asset(
                  'assets/images/islamic-ornament.png',
                  fit: BoxFit.cover,
                ),
              )
            : null,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: coursesViewModel.isBusy ? Constants.padding : 0,
          ),
          child: coursesViewModel.isBusy
              ? const Center(child: CircularProgressIndicator())
              : TimePlanner(
                  isRamadan: coursesViewModel.isRamadan,
                  startHour: lowestStartHour ?? 6,
                  endHour: (highestEndHour ?? 18) + 1,
                  currentTimeAnimation: false,
                  onRefresh: () async {
                    await ref
                        .read(coursesViewModelProvider)
                        .getStudentSchedule();
                  },
                  style: TimePlannerStyle(
                    horizontalTaskPadding: Constants.spacing,
                    cellHeight: coursesViewModel.isRamadan ? 120 : 80,
                    dividerColor: Theme.of(context).colorScheme.error,
                  ),
                  headers: [
                    TimePlannerTitle(
                      title: context.s.sunday,
                      titleStyle: todayDayStyle(
                        today == Day.sun ||
                            today == Day.fri ||
                            today == Day.sat,
                      ),
                    ),
                    TimePlannerTitle(
                      title: context.s.monday,
                      titleStyle: todayDayStyle(today == Day.mon),
                    ),
                    TimePlannerTitle(
                      title: context.s.tuesday,
                      titleStyle: todayDayStyle(today == Day.tue),
                    ),
                    TimePlannerTitle(
                      title: context.s.wednesday,
                      titleStyle: todayDayStyle(today == Day.wed),
                    ),
                    TimePlannerTitle(
                      title: context.s.thursday,
                      titleStyle: todayDayStyle(today == Day.thu),
                    ),
                  ],
                  tasks: timePlannerTasks,
                ),
        ),
      ),
    );
  }
}
