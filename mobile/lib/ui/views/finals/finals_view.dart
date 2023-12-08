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

    return Scaffold(
      appBar: AppBar(title: Text(context.s.finals)),
      body: FinalsBody(finalsState: finalsState, finalsVM: finalsVM),
    );
  }
}

class FinalsBody extends StatelessWidget {
  final FinalsState finalsState;
  final FinalsViewModel finalsVM;

  const FinalsBody({
    super.key,
    required this.finalsState,
    required this.finalsVM,
  });

  @override
  Widget build(BuildContext context) {
    switch (finalsState.status) {
      case FinalsStatus.loadingFinals:
        return const Center(child: CircularProgressIndicator());
      case FinalsStatus.errorLoadingFinals:
        return ErrorView(
          title: context.s.something_went_wrong,
          subtitle: context.s.failed_to_load_finals,
          onRefresh: () => finalsVM.getFinalExams(),
        );
      default:
        return FinalsList(finalsVM: finalsVM);
    }
  }
}

class FinalsList extends ConsumerWidget {
  final FinalsViewModel finalsVM;

  const FinalsList({
    super.key,
    required this.finalsVM,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startDate = finalsVM.firstExamDate;
    final endDate = finalsVM.lastExamDate;
    final today = DateTime.now();
    List<DateTime> dates = List.generate(
      endDate.difference(startDate).inDays + 1,
      (index) => startDate.add(Duration(days: index)),
    );

    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(finalsViewModelProvider.notifier).getFinalExams();
      },
      child: ListView.builder(
        itemCount: dates.length,
        itemBuilder: (context, index) {
          final date = dates[index];
          final exams = finalsVM.getExamsForDate(date);
          bool isToday = date.day == today.day &&
              date.month == today.month &&
              date.year == today.year;
          return DateExamRow(date: date, exams: exams, isToday: isToday);
        },
      ),
    );
  }
}

class DateExamRow extends StatelessWidget {
  final DateTime date;
  final List<FinalExam> exams;
  final bool isToday;

  const DateExamRow({
    super.key,
    required this.date,
    required this.exams,
    this.isToday = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      color: isToday ? Theme.of(context).highlightColor : Colors.transparent,
      child: Row(
        children: [
          DateColumn(date: date),
          ExamsColumn(exams: exams),
        ],
      ),
    );
  }
}

class DateColumn extends StatelessWidget {
  final DateTime date;

  const DateColumn({
    super.key,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: Column(
        children: [
          Text(
            intl.DateFormat('EE').format(date),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ), // Weekday
          Text(
            intl.DateFormat('dd').format(date),
            style: const TextStyle(fontSize: 16),
          ), // Date
        ],
      ),
    );
  }
}

class ExamsColumn extends StatelessWidget {
  final List<FinalExam> exams;

  const ExamsColumn({super.key, required this.exams});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: exams.map((exam) => ExamDetailCard(exam: exam)).toList(),
      ),
    );
  }
}

class ExamDetailCard extends StatelessWidget {
  final FinalExam exam;

  const ExamDetailCard({super.key, required this.exam});

  String getFormattedTime(DateTime examDateTime) {
    return intl.DateFormat('h:mm a').format(examDateTime);
  }

  @override
  Widget build(BuildContext context) {
    final examDate = intl.DateFormat('EEEE, MMMM d').format(exam.examDate);
    final examTime = exam.examTime.format(context);

    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              exam.courseName,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              '${exam.courseCode} - Room: ${exam.examRoom}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Date: $examDate\nTime: $examTime',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 16),
            CountdownTimerWidget(exam.examDate),
          ],
        ),
      ),
    );
  }
}
