import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/models/offered_course.dart';
import 'package:flutter/material.dart';

class OfferedCourseListTile extends StatelessWidget {
  final OfferedCourse offeredCourse;
  final bool isSelected;
  final bool isDeleting;
  final void Function() onTap;

  const OfferedCourseListTile({
    super.key,
    required this.offeredCourse,
    required this.isSelected,
    required this.isDeleting,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = switch (isSelected) {
      true => context.colorScheme.tertiaryContainer,
      false => switch (isDeleting) {
          true => context.colorScheme.errorContainer,
          false => context.colorScheme.secondaryContainer
        }
    };
    final foregroundColor = switch (isSelected) {
      true => context.colorScheme.onTertiaryContainer,
      false => switch (isDeleting) {
          true => context.colorScheme.onErrorContainer,
          false => context.colorScheme.onSecondaryContainer
        }
    };

    return Padding(
      padding: const EdgeInsets.only(
        left: Constants.padding,
        right: Constants.padding,
        bottom: Constants.padding,
      ),
      child: ListTile(
        tileColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            Constants.padding,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: Constants.padding,
        ),
        leading: Column(
          children: [
            // This makes the icon aligned with the trailing checkbox.
            const SizedBox(height: Constants.spacing * 1.65),
            switch (offeredCourse.isClosed) {
              true => const Icon(Icons.lock_rounded),
              false => const Icon(Icons.lock_open_rounded)
            }
          ],
        ),
        title: Text(
          offeredCourse.courseCode,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: foregroundColor,
          ),
        ),
        isThreeLine: true,
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              offeredCourse.courseName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: foregroundColor,
              ),
            ),
            Text(
              '${context.s.credit_hours}: ${offeredCourse.creditHours}',
              style: context.textTheme.bodyMedium?.copyWith(
                color: foregroundColor,
              ),
            ),
          ],
        ),
        trailing: Column(
          children: [
            Checkbox(
              value: isSelected,
              onChanged: (bool? newValue) {
                onTap();
              },
            ),
          ],
        ),
        onTap: offeredCourse.isClosed ? null : onTap,
      ),
    );
  }
}
