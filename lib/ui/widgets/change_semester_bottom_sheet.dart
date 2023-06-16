import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/providers/actor_details/actor_details_notifier.dart';
import 'package:alyamamah/core/utils.dart';
import 'package:alyamamah/ui/widgets/yu_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangeSemesterBottomSheet extends ConsumerWidget {
  final String selectedSemester;

  /// If you want the sheet to close instantly after the selects a semester,
  /// dont await for stuff to finish because the close method runs after your
  /// code runs.
  final Future<void> Function(String semester) onSemesterChanged;

  const ChangeSemesterBottomSheet({
    super.key,
    required this.selectedSemester,
    required this.onSemesterChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actorDetails = ref.watch(actorDetailsProvider);

    final semesters = actorDetails != null
        ? Utils.generateSemesterRange(
            actorDetails.sessionInfo.joinSemester,
            actorDetails.semester.currentSemester,
          ).reversed.toList()
        : [];

    return YUBottomSheet(
      title: context.s.choose_semester,
      description: context.s.choose_semester_description,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: semesters.length,
            itemBuilder: (BuildContext context, int index) {
              final isFirst = index == 0;
              final semester = semesters[index];

              return ListTile(
                leading: Text(
                  isFirst ? '🌟' : '📜',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                title: Text(
                  Utils.semesterToReadable(context, semester),
                ),
                subtitle: Text(
                  isFirst ? context.s.current : context.s.previous,
                ),
                trailing: selectedSemester == semester
                    ? Text(
                        '✅',
                        style: Theme.of(context).textTheme.bodyLarge,
                      )
                    : null,
                onTap: () async {
                  await onSemesterChanged(semester);

                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                },
              );
            },
          ),
        )
      ],
    );
  }
}
