import 'package:alyamamah/app/model/student_schedule_course.dart';
import 'package:alyamamah/app/model/timetable_entry.dart';
import 'package:flutter/material.dart';

class BreakBlock {
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  BreakBlock({
    required this.startTime,
    required this.endTime,
  });
}

class StudentScheduleDay extends StatelessWidget {
  final List<StudentScheduleCourse> studentSchedule;
  final Day day;

  const StudentScheduleDay({
    super.key,
    required this.studentSchedule,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    final studentScheduleFilteredByDay = studentSchedule
        .where(
          (scheduleCourse) => scheduleCourse.timeTable.any(
            (timetableEntry) => timetableEntry.days.contains(day),
          ),
        )
        .toList()
      ..sort(
        (a, b) => a.timeTable.first.startTime.hour
            .compareTo(b.timeTable.first.startTime.hour),
      );
    // get breaks by comparing the end time of the previous course with the start time of the next course
    final breaks =
        studentScheduleFilteredByDay.map<BreakBlock?>((currentCourse) {
      final index = studentScheduleFilteredByDay.indexOf(currentCourse);
      if (index + 1 == studentScheduleFilteredByDay.length) {
        return null;
      }

      final nextCourse = studentScheduleFilteredByDay[index + 1];

      final currentTimetableEntry = currentCourse.timeTable
          .firstWhere((element) => element.days.contains(day));
      final nextTimetableEntry = nextCourse.timeTable
          .firstWhere((element) => element.days.contains(day));

      if (currentTimetableEntry.endTime.hour ==
              nextTimetableEntry.startTime.hour &&
          currentTimetableEntry.endTime.minute ==
              nextTimetableEntry.startTime.minute) {
        return null;
      }

      return BreakBlock(
        startTime: currentTimetableEntry.endTime,
        endTime: nextTimetableEntry.startTime,
      );
    }).toList();

    return Scaffold(
      body: ListView.separated(
        itemCount: studentScheduleFilteredByDay.length,
        itemBuilder: (BuildContext context, int index) {
          final studentScheduleCourse = studentScheduleFilteredByDay[index];
          final studentScheduleCourseTimeTable =
              studentScheduleCourse.timeTable.firstWhere(
            (timetableEntry) => timetableEntry.days.contains(day),
          );

          return ListTile(
            leading: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  studentScheduleCourseTimeTable.startTime.format(context),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  studentScheduleCourseTimeTable.endTime.format(context),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            title: Text(studentScheduleCourse.courseCode),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(studentScheduleCourse.courseName),
                Text(studentScheduleCourse.activityDesc),
              ],
            ),
            isThreeLine: true,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          if (breaks[index] != null) {
            return Column(
              children: <Widget>[
                const Divider(),
                ListTile(
                  leading: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        breaks[index]!.startTime.format(context),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        breaks[index]!.endTime.format(context),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  title: const Text('Break'),
                  trailing: const Icon(Icons.free_breakfast),
                ),
                const Divider(),
              ],
            );
          }
          return const Divider();
        },
      ),
    );
  }
}
