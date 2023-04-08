import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/ui/views/courses/change_semester_bottom_sheet.dart';
import 'package:alyamamah/ui/views/courses/courses_schedule.dart';
import 'package:alyamamah/ui/views/courses/courses_view_model.dart';
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
            await showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return const ChangeSemesterBottomSheet();
              },
            );
          },
        ),
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
              : CoursesSchedule(
                  scheduleDays: coursesViewModel.scheduleDays,
                  onCourseTap: (onCourseTap) async {
                    await ref
                        .read(coursesViewModelProvider)
                        .navigateToCourseDetails(onCourseTap);
                  },
                ),
        ),
      ),
    );
  }
}
