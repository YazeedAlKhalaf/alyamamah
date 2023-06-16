import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/ui/views/grades/courses_result_list_view.dart';
import 'package:alyamamah/ui/views/grades/courses_result_list_view_model.dart';
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
    final coursesResultListViewState =
        ref.watch(coursesResultListViewModelProvider);
    final isCurrentGradesEmpty =
        coursesResultListViewState.coursesResults.isEmpty;

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
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Container(
            margin: const EdgeInsets.only(
              right: Constants.padding,
              left: Constants.padding,
              bottom: Constants.padding,
            ),
            padding: const EdgeInsets.all(Constants.spacing),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(Constants.padding),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        context.s.semester_gpa,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        isCurrentGradesEmpty ||
                                coursesResultListViewState.studentGPA == null
                            ? ''
                            : coursesResultListViewState
                                .studentGPA!.semesterGPA,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 1,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                    borderRadius: BorderRadius.circular(Constants.padding),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        context.s.cumulative_gpa,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        isCurrentGradesEmpty ||
                                coursesResultListViewState.studentGPA == null
                            ? ''
                            : coursesResultListViewState.studentGPA!.cumGPA,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: CoursesResultListView(
        semester: gradesViewState.selectedSemester,
      ),
    );
  }
}
