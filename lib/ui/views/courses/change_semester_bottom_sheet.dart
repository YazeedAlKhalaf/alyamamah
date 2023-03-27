import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/providers/actor_details/actor_details_notifier.dart';
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

    return YUBottomSheet(
      title: context.s.choose_semester,
      description: context.s.choose_semester_description,
      children: actorDetails != null
          ? [
              ListTile(
                leading: Text(
                  '🌟',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                title: Text(actorDetails.semester.currentSemesterDesc),
                subtitle: Text(context.s.current),
                trailing: coursesViewModel.selectedSemester ==
                        actorDetails.semester.currentSemester
                    ? const Text('✅')
                    : null,
                onTap: () async {
                  await coursesViewModel.changeSemester(
                    actorDetails.semester.currentSemester,
                  );

                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                },
              ),
              if (actorDetails.semester.prevSemester.isNotEmpty ||
                  actorDetails.semester.prevSemester !=
                      actorDetails.semester.currentSemester)
                ListTile(
                  leading: Text(
                    '📜',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  title: Text(actorDetails.semester.prevSemesterDesc),
                  subtitle: Text(context.s.previous),
                  trailing: coursesViewModel.selectedSemester ==
                          actorDetails.semester.prevSemester
                      ? const Text('✅')
                      : null,
                  onTap: () async {
                    await coursesViewModel.changeSemester(
                      actorDetails.semester.prevSemester,
                    );

                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  },
                ),
            ]
          : [],
    );
  }
}
