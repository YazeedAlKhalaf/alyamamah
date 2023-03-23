import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/ui/views/courses/models/schedule_entry.dart';
import 'package:flutter/material.dart';

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
            ListTile(
              leading: Text(
                '🆔',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              title: Text(context.s.course_code),
              subtitle: Text(scheduleEntry.courseCode),
            ),
            ListTile(
              leading: Text(
                '🚪',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              title: Text(context.s.room),
              subtitle: Text(scheduleEntry.room),
            ),
            ListTile(
              leading: Text(
                '🚪',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              title: Text(context.s.section),
              subtitle: Text(scheduleEntry.section),
            ),
            ListTile(
              leading: Text(
                '📝',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              title: Text(context.s.activity_description),
              subtitle: Text(scheduleEntry.activityDesc),
            ),
            ListTile(
              leading: Text(
                '👨‍🏫',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              title: Text(context.s.instructor),
              subtitle: Text(scheduleEntry.instructor),
            ),
            ListTile(
              leading: Text(
                '⏰',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              title: Text(context.s.credit_hours),
              subtitle: Text(scheduleEntry.creditHours),
            ),
            ListTile(
              leading: Text(
                '🏫',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              title: Text(context.s.campus_name),
              subtitle: Text(scheduleEntry.campusName),
            ),
            ListTile(
              leading: Text(
                '🗑️',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              title: Text(context.s.course_deleted_q),
              subtitle: Text(
                scheduleEntry.courseDeleted ? context.s.yes : context.s.no,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
