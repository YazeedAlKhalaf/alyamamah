import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/ui/views/courses/course_details_tile.dart';
import 'package:alyamamah/ui/views/courses/models/schedule_entry.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CourseDetailsView extends StatelessWidget {
  final ScheduleEntry scheduleEntry;

  const CourseDetailsView({
    super.key,
    required this.scheduleEntry,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(scheduleEntry.courseName),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            CourseDetailsTile(
              emoji: '🆔',
              title: context.s.course_code,
              subtitle: scheduleEntry.courseCode,
            ),
            CourseDetailsTile(
              emoji: '🚪',
              title: context.s.room,
              subtitle: scheduleEntry.room,
            ),
            CourseDetailsTile(
              emoji: '🔢',
              title: context.s.section,
              subtitle: scheduleEntry.section,
            ),
            CourseDetailsTile(
              emoji: '📝',
              title: context.s.activity_description,
              subtitle: scheduleEntry.activityDesc,
            ),
            CourseDetailsTile(
              emoji: '👨‍🏫',
              title: context.s.instructor,
              subtitle: scheduleEntry.instructor,
            ),
            CourseDetailsTile(
              emoji: '⏰',
              title: context.s.credit_hours,
              subtitle: scheduleEntry.creditHours,
            ),
            CourseDetailsTile(
              emoji: '🏫',
              title: context.s.campus_name,
              subtitle: scheduleEntry.campusName,
            ),
            CourseDetailsTile(
              emoji: '🗑️',
              title: context.s.course_deleted_q,
              subtitle:
                  scheduleEntry.courseDeleted ? context.s.yes : context.s.no,
            ),
          ],
        ),
      ),
    );
  }
}
