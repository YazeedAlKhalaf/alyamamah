import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/models/final_exam.dart';
import 'package:alyamamah/ui/views/finals/finals_state.dart';
import 'package:alyamamah/ui/views/finals/finals_view_model.dart';
import 'package:alyamamah/ui/widgets/countdown_timer.dart';
import 'package:alyamamah/ui/widgets/error_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart' as intl;

class FinalsView extends ConsumerStatefulWidget {
  const FinalsView({super.key});

  @override
  ConsumerState<FinalsView> createState() => _FinalsViewState();
}

class _FinalsViewState extends ConsumerState<FinalsView> {
  @override
  void initState() {
    super.initState();

    Future(() async {
      await ref.read(finalsViewModelProvider.notifier).getFinalExams();
    });
  }

  @override
  Widget build(BuildContext context) {
    final finalsState = ref.watch(finalsViewModelProvider);
    final finalsVM = ref.read(finalsViewModelProvider.notifier);

    final startDate = finalsVM.firstExamDate;
    final endDate = finalsVM.lastExamDate;

    List<DateTime> dates = List.generate(
      endDate.difference(startDate).inDays + 1, // +1 to include the last day
      (index) => startDate.add(Duration(days: index)),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(context.s.finals),
      ),
      body: switch (finalsState.status) {
        FinalsStatus.loadingFinals => const Center(
            child: CircularProgressIndicator(),
          ),
        FinalsStatus.errorLoadingFinals => ErrorView(
            title: context.s.something_went_wrong,
            subtitle: context.s.failed_to_load_finals,
            onRefresh: () async {
              await ref.read(finalsViewModelProvider.notifier).getFinalExams();
            },
          ),
        _ => RefreshIndicator(
            onRefresh: () async {
              await ref.read(finalsViewModelProvider.notifier).getFinalExams();
            },
            child: ListView.builder(
              itemCount: dates.length,
              itemBuilder: (context, index) {
                final date = dates[index];
                final exams = finalsVM.getExamsForDate(date);

                return DateExamRow(date: date, exams: exams);
              },
            ),

            // child: ListView.builder(
            //   itemCount: finalsState.finals.length,
            //   itemBuilder: (context, index) {
            //     final finalExam = finalsState.finals[index];

            //     return Card(
            //       child: ListTile(
            //         title: Text(finalExam.courseCode),
            //         subtitle: Text(finalExam.courseName),
            //         trailing: Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           crossAxisAlignment: CrossAxisAlignment.end,
            //           children: [
            //             if (finalExam.isToday)
            //               const Text(
            //                 'Today',
            //                 style: TextStyle(
            //                   color: Colors.red,
            //                 ),
            //               ),
            //             Text(
            //               intl.DateFormat('yyyy-MM-dd – kk:mm').format(
            //                 finalExam.examDate,
            //               ),
            //             ),
            //             if (!finalExam.isToday)
            //               Text(
            //                 '${finalExam.timeUntilExam.inDays} days remaining',
            //               ),
            //             if (finalExam.isToday ||
            //                 finalExam.timeUntilExam.inDays <= 7)
            //               CountdownTimerWidget(finalExam.examDate),
            //           ],
            //         ),
            //       ),
            //     );
            //   },
            // ),
          ),
      },
    );
  }
}

class DateExamRow extends StatelessWidget {
  final DateTime date;
  final List<FinalExam> exams;

  const DateExamRow({super.key, required this.date, required this.exams});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Left side - Date
        SizedBox(
          width: 60,
          child: Column(
            children: [
              Text(intl.DateFormat('EE').format(date)), // Weekday
              Text(intl.DateFormat('dd').format(date)), // Date
            ],
          ),
        ),

        // Right side - Exams
        Expanded(
          child: Column(
            children: exams.map((exam) => ExamDetailCard(exam: exam)).toList(),
          ),
        ),
      ],
    );
  }
}

class ExamDetailCard extends StatelessWidget {
  final FinalExam exam;

  const ExamDetailCard({super.key, required this.exam});

  String getFormattedTime(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return intl.DateFormat('h:mm a').format(dt);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          exam.courseName,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${exam.courseCode} - ${exam.examRoom}\n${getFormattedTime(exam.examTime)}',
            ),
            CountdownTimerWidget(exam.examDate),
          ],
        ),
      ),
    );
  }
}
