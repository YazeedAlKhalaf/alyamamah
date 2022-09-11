import 'package:alyamamah/app/model/timetable_entry.dart';
import 'package:alyamamah/my_schedule/provider/my_schedule_provider.dart';
import 'package:alyamamah/my_schedule/view/student_schedule_day.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MySchedulePage extends ConsumerStatefulWidget {
  const MySchedulePage({super.key});

  @override
  ConsumerState<MySchedulePage> createState() => _MySchedulePageState();
}

class _MySchedulePageState extends ConsumerState<MySchedulePage> {
  late final PageController pageController;

  @override
  void initState() {
    super.initState();

    final day = DateTime.now().dayFromWeekday;
    pageController = PageController(initialPage: day.index);

    getStudentSchedule();
  }

  Future<void> getStudentSchedule() async {
    await ref.read(myScheduleProvider.notifier).getStudentSchedule();
  }

  @override
  Widget build(BuildContext context) {
    final myScheduleNotifier = ref.read(myScheduleProvider.notifier);
    final myScheduleState = ref.watch(myScheduleProvider);

    return Scaffold(
      appBar: AppBar(),
      body: Builder(
        builder: (BuildContext context) {
          if (myScheduleState.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (myScheduleState.studentSchedule == null) {
            return const Center(
              child: Text('Your schedule is empty'),
            );
          }

          return Column(
            children: [
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Day.values.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        Day.values[index].name,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(
                              color: index == myScheduleState.selectedDay.index
                                  ? Theme.of(context).colorScheme.primary
                                  : null,
                            ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemCount: Day.values.length,
                  onPageChanged: (int index) {
                    myScheduleNotifier.setSelectedDay(Day.values[index]);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return StudentScheduleDay(
                      studentSchedule: myScheduleState.studentSchedule!,
                      day: Day.values[index],
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
