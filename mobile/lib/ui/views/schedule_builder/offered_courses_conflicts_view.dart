import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/models/offered_course.dart';
import 'package:alyamamah/ui/views/courses/course_widget.dart';
import 'package:alyamamah/ui/views/schedule_builder/models/conflict.dart';
import 'package:alyamamah/ui/views/schedule_builder/schedule_builder_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OfferedCoursesConflictsView extends ConsumerWidget {
  final List<Conflict> conflicts;
  final List<OfferedCourse> offeredCourses;

  const OfferedCoursesConflictsView({
    super.key,
    required this.conflicts,
    required this.offeredCourses,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        ...conflicts.map((conflict) {
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
                                .read(scheduleBuilderViewModelProvider.notifier)
                                .removeCourseFromSelectedSchedule(
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
                                .read(scheduleBuilderViewModelProvider.notifier)
                                .removeCourseFromSelectedSchedule(
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
}
