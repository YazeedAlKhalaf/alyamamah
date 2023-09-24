import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/models/absence.dart';
import 'package:alyamamah/ui/views/absences/absences_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AbsenceListTile extends ConsumerWidget {
  final Absence absence;

  const AbsenceListTile({
    super.key,
    required this.absence,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final percentage = double.tryParse(
          absence.totalAbsencePercent,
        ) ??
        0;

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
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox.square(
              dimension: 25,
              child: CircularProgressIndicator(
                value: percentage / 20,
                backgroundColor:
                    Theme.of(context).colorScheme.tertiary.withOpacity(0.3),
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            const SizedBox(height: Constants.spacing),
            Text(
              '${absence.totalAbsencePercent}%',
              textAlign: TextAlign.center,
            ),
          ],
        ),
        title: Text(
          absence.courseName,
          style: context.textTheme.titleMedium?.copyWith(
            color: context.colorScheme.onSecondaryContainer,
          ),
        ),
        subtitle: Text(
          '${context.s.absences_count(absence.countAbsence)} | ${context.s.lates_count(absence.countLate)}',
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.onSecondaryContainer,
          ),
        ),
        trailing: const Icon(Icons.chevron_right_rounded),
        onTap: () async {
          await ref
              .read(absencesViewModelProvider)
              .navigateToAbsenceDetails(absence);
        },
      ),
    );
  }
}
