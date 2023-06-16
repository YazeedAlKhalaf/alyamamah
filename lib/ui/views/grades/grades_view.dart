import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/ui/views/grades/courses_result_list_view.dart';
import 'package:alyamamah/ui/views/grades/grades_view_model.dart';
import 'package:alyamamah/ui/widgets/change_semester_bottom_sheet.dart';
import 'package:alyamamah/ui/widgets/yu_show.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GradesView extends ConsumerWidget {
  const GradesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gradesViewState = ref.watch(gradesViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.s.grades),
        leading: IconButton(
          icon: Text(
            '📚',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          onPressed: () async {
            await YUShow.modalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return ChangeSemesterBottomSheet(
                  selectedSemester: gradesViewState.selectedSemester,
                  onSemesterChanged: (String semester) async {
                    ref
                        .read(gradesViewModelProvider.notifier)
                        .changeSemester(semester);
                  },
                );
              },
            );
          },
        ),
      ),
      body: CoursesResultListView(
        semester: gradesViewState.selectedSemester,
      ),
    );
  }
}
