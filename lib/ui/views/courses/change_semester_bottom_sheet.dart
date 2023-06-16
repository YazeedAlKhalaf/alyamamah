import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/providers/actor_details/actor_details_notifier.dart';
import 'package:alyamamah/core/utils.dart';
import 'package:alyamamah/ui/views/courses/courses_view_model.dart';
import 'package:alyamamah/ui/widgets/yu_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangeSemesterBottomSheet extends ConsumerWidget {
  const ChangeSemesterBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actorDetails = ref.watch(actorDetailsProvider);
    final coursesViewModel = ref.watch(coursesViewModelProvider);

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
                trailing: coursesViewModel.selectedSemester == semester
                    ? Text(
                        '✅',
                        style: Theme.of(context).textTheme.bodyLarge,
                      )
                    : null,
                onTap: () async {
                  coursesViewModel.changeSemester(semester);

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
