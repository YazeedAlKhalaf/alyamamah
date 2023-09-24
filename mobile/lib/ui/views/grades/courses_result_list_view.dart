import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/utils.dart';
import 'package:alyamamah/ui/views/grades/course_result_list_tile.dart';
import 'package:alyamamah/ui/views/grades/courses_result_list_view_model.dart';
import 'package:alyamamah/ui/views/grades/courses_result_list_view_state.dart';
import 'package:alyamamah/ui/views/grades/grades_view_model.dart';
import 'package:alyamamah/ui/widgets/change_semester_bottom_sheet.dart';
import 'package:alyamamah/ui/widgets/empty_view.dart';
import 'package:alyamamah/ui/widgets/error_view.dart';
import 'package:alyamamah/ui/widgets/yu_show.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoursesResultListView extends ConsumerStatefulWidget {
  final String semester;

  const CoursesResultListView({
    super.key,
    required this.semester,
  });

  @override
  ConsumerState<CoursesResultListView> createState() =>
      _CoursesResultListViewState();
}

class _CoursesResultListViewState extends ConsumerState<CoursesResultListView> {
  @override
  void initState() {
    super.initState();

    Future(() async {
      await ref
          .read(coursesResultListViewModelProvider.notifier)
          .getCoursesResults(semester: widget.semester);
      await ref
          .read(coursesResultListViewModelProvider.notifier)
          .getStudentGPA(semester: widget.semester);
    });
  }

  @override
  void didUpdateWidget(CoursesResultListView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.semester != widget.semester) {
      Future(() async {
        await ref
            .read(coursesResultListViewModelProvider.notifier)
            .getCoursesResults(semester: widget.semester);
        await ref
            .read(coursesResultListViewModelProvider.notifier)
            .getStudentGPA(semester: widget.semester);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final coursesResultListViewModel =
        ref.watch(coursesResultListViewModelProvider);

    final isLoading = coursesResultListViewModel.status ==
            CoursesResultListViewStatus.loading ||
        coursesResultListViewModel.status ==
            CoursesResultListViewStatus.unknown;
    final isErrorLoading = coursesResultListViewModel.status ==
        CoursesResultListViewStatus.errorLoading;

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return RefreshIndicator(
      onRefresh: () async {
        await ref
            .read(coursesResultListViewModelProvider.notifier)
            .getCoursesResults(semester: widget.semester);
        await ref
            .read(coursesResultListViewModelProvider.notifier)
            .getStudentGPA(semester: widget.semester);
      },
      child: isErrorLoading
          ? ErrorView(
              title: context
                  .s.something_went_wrong_fetching_grades_for_this_semester,
              subtitle: Utils.semesterToReadable(
                context,
                widget.semester,
              ),
            )
          : coursesResultListViewModel.coursesResults.isEmpty
              ? EmptyView(
                  title: context
                      .s.the_grades_of_this_semester_are_not_available_yet,
                  subtitle: Utils.semesterToReadable(
                    context,
                    widget.semester,
                  ),
                  action: FilledButton.icon(
                    onPressed: () async {
                      await YUShow.modalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return ChangeSemesterBottomSheet(
                            selectedSemester: widget.semester,
                            onSemesterChanged: (String semester) async {
                              ref
                                  .read(gradesViewModelProvider.notifier)
                                  .changeSemester(semester);
                            },
                          );
                        },
                      );
                    },
                    icon: const Icon(Icons.book_rounded),
                    label: Text(context.s.choose_semester),
                  ),
                )
              : ListView.separated(
                  itemCount: coursesResultListViewModel.coursesResults.length,
                  itemBuilder: (BuildContext context, int index) {
                    final courseResult =
                        coursesResultListViewModel.coursesResults[index];

                    return CourseResultListTile(
                      courseResult: courseResult,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: Constants.spacing);
                  },
                ),
    );
  }
}
