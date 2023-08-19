import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
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
        tileColor: context.colorScheme.secondaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            Constants.padding,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: Constants.padding,
        ),
        leading: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 5,
                spreadRadius: 1,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Utils.generateBorderColor(
              Utils.generateColorFromCourse(courseResult.courseCode),
            ),
          ),
        ),
        title: Text(
          courseResult.courseCode,
          style: context.textTheme.titleMedium?.copyWith(
            color: context.colorScheme.onSecondaryContainer,
          ),
        ),
        subtitle: Text(
          courseResult.courseName,
          style: context.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Text(
          '${courseResult.gradeDesc}\n${courseResult.confirmedMark}',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Utils.colorFromGrade(context, courseResult.gradeDesc),
              ),
        ),
        onTap: () {},
      ),
    );
  }
}
