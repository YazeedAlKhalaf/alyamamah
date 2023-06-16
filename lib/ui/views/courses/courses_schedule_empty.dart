import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/utils.dart';
import 'package:alyamamah/ui/views/courses/change_semester_bottom_sheet.dart';
import 'package:alyamamah/ui/views/courses/courses_view_model.dart';
import 'package:alyamamah/ui/widgets/yu_show.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoursesScheduleEmpty extends ConsumerWidget {
  const CoursesScheduleEmpty({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coursesViewModel = ref.watch(coursesViewModelProvider);

    return Padding(
      padding: const EdgeInsets.all(Constants.padding),
      child: RefreshIndicator(
        onRefresh: () async {
          await coursesViewModel.getStudentSchedule();
        },
        child: ListView(
          children: [
            Image.asset(
              'assets/images/man-searching-for-something.png',
              height: 350,
            ),
            Text(
              context.s.this_semester_has_no_courses_yet,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            Text(
              Utils.semesterToReadable(
                context,
                coursesViewModel.selectedSemester,
              ),
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Constants.padding),
            FilledButton.icon(
              onPressed: () async {
                await YUShow.modalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return const ChangeSemesterBottomSheet();
                  },
                );
              },
              icon: const Icon(Icons.book_rounded),
              label: Text(context.s.choose_semester),
            ),
          ],
        ),
      ),
    );
  }
}
