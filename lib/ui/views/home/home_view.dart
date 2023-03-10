import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/extensions/time_of_day.dart';
import 'package:alyamamah/ui/views/home/home_view_model.dart';
import 'package:alyamamah/ui/widgets/time_planner/time_planner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    Future(() async {
      await ref.read(homeViewModelProvider).getStudentSchedule();
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeViewModel = ref.watch(homeViewModelProvider);

    final timePlannerTasks = <TimePlannerTask>[];
    int? lowestStartHour;
    int? highestEndHour;
    for (final e in homeViewModel.scheduleDays.entries) {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                e2.courseCode,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Text(
                e2.room,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
        ));
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(context.s.my_courses),
        surfaceTintColor: Theme.of(context).colorScheme.surface,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: homeViewModel.isBusy ? Constants.padding : 0,
          ),
          child: homeViewModel.isBusy
              ? const Center(child: CircularProgressIndicator())
              : TimePlanner(
                  startHour: lowestStartHour ?? 6,
                  endHour: (highestEndHour ?? 18) + 1,
                  currentTimeAnimation: false,
                  onRefresh: () async {
                    await ref.read(homeViewModelProvider).getStudentSchedule();
                  },
                  style: TimePlannerStyle(
                    horizontalTaskPadding: Constants.spacing,
                    cellHeight: 60,
                    dividerColor: Theme.of(context).colorScheme.error,
                  ),
                  headers: [
                    TimePlannerTitle(
                      title: context.s.sunday,
                    ),
                    TimePlannerTitle(
                      title: context.s.monday,
                    ),
                    TimePlannerTitle(
                      title: context.s.tuesday,
                    ),
                    TimePlannerTitle(
                      title: context.s.wednesday,
                    ),
                    TimePlannerTitle(
                      title: context.s.thursday,
                    ),
                  ],
                  tasks: timePlannerTasks,
                ),
        ),
      ),
    );
  }
}
