import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/models/offered_course.dart';
import 'package:alyamamah/ui/views/courses/course_widget.dart';
import 'package:alyamamah/ui/views/courses/courses_schedule.dart';
import 'package:alyamamah/ui/views/courses/models/schedule_entry.dart';
import 'package:alyamamah/ui/views/schedule_builder/schedule_builder_view_model.dart';
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
        itemCount: scheduleBuilderViewState.offeredCoursesSchedules.length,
        itemBuilder: (BuildContext context, int index) {
          final offeredCoursesSchedule =
              scheduleBuilderViewState.offeredCoursesSchedules[index];

          if (offeredCoursesSchedule.hasConflicts) {
            return ListView(
              children: [
                Text(
                  context.s.schedule_has_conflicts,
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: context.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: Constants.padding),
                ...offeredCoursesSchedule.conflicts.map((conflict) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Constants.padding,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: context.colorScheme.tertiaryContainer,
                        borderRadius: BorderRadius.circular(Constants.padding),
                      ),
                      padding: const EdgeInsets.all(Constants.padding),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                CourseWidget(
                                  height: 80,
                                  scheduleEntry: conflict.firstEntry,
                                  onTap: () {},
                                  isSmall: false,
                                ),
                                const SizedBox(height: Constants.spacing),
                                FilledButton(
                                  onPressed: () {
                                    ref
                                        .read(scheduleBuilderViewModelProvider
                                            .notifier)
                                        .removeCourseAndRegenerate(
                                          widget.offeredCourses,
                                          conflict.firstEntry.courseCode,
                                        );
                                  },
                                  child: Text(context.s.remove_course),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                CourseWidget(
                                  height: 80,
                                  scheduleEntry: conflict.secondEntry,
                                  onTap: () {},
                                  isSmall: false,
                                ),
                                const SizedBox(height: Constants.spacing),
                                FilledButton(
                                  onPressed: () {
                                    ref
                                        .read(scheduleBuilderViewModelProvider
                                            .notifier)
                                        .removeCourseAndRegenerate(
                                          widget.offeredCourses,
                                          conflict.secondEntry.courseCode,
                                        );
                                  },
                                  child: Text(context.s.remove_course),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ],
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
              onPressed: () async {
                // TODO: navigate to success screen or payment screen based on response.
              },
              child: Text(
                context.s.choose_schedule,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
