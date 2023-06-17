import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/models/course_result.dart';
import 'package:alyamamah/core/utils.dart';
import 'package:flutter/material.dart';

class CourseResultListTile extends StatelessWidget {
  const CourseResultListTile({
    super.key,
    required this.courseResult,
  });

  final CourseResult courseResult;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Constants.padding,
      ),
      child: ListTile(
        tileColor: Theme.of(context).colorScheme.secondaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            Constants.padding,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: Constants.padding,
        ),
        title: Text(
          courseResult.courseCode,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
        ),
        subtitle: Text(
          courseResult.courseName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
        ),
        trailing: Text(
          '${courseResult.gradeDesc}\n${courseResult.confirmedMark}',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Utils.colorFromGrade(context, courseResult.gradeDesc),
              ),
          textAlign: TextAlign.center,
        ),
        onTap: () {},
      ),
    );
  }
}
