import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/models/course_result.dart';
import 'package:alyamamah/core/providers/feature_flags/feature_flags_state_notifier.dart';
import 'package:alyamamah/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CourseResultListTile extends ConsumerWidget {
  const CourseResultListTile({
    super.key,
    required this.courseResult,
  });

  final CourseResult courseResult;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isNumberGradeEnabled =
        ref.watch(featureFlagsStateNotifierProvider).isNumberGradesEnabled;

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
          isNumberGradeEnabled
              ? '${courseResult.gradeDesc}\n${courseResult.confirmedMark}'
              : courseResult.gradeDesc,
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
