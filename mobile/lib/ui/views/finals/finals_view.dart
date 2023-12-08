import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/models/final_exam.dart';
import 'package:alyamamah/ui/views/finals/finals_state.dart';
import 'package:alyamamah/ui/views/finals/finals_view_model.dart';
import 'package:alyamamah/ui/widgets/countdown_timer.dart';
import 'package:alyamamah/ui/widgets/empty_view.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(context.s.finals),
      ),
      body: const FinalsBody(),
    );
  }
}

class FinalsBody extends ConsumerWidget {
  const FinalsBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final finalsState = ref.watch(finalsViewModelProvider);
    final finalsVM = ref.read(finalsViewModelProvider.notifier);

    if (finalsState.status == FinalsStatus.loadingFinals) {
      return const Center(child: CircularProgressIndicator());
    }

    if (finalsState.status == FinalsStatus.errorLoadingFinals) {
      return ErrorView(
        title: context.s.something_went_wrong,
        subtitle: context.s.failed_to_load_finals,
        onRefresh: () async {
          await finalsVM.getFinalExams();
        },
      );
    }

    if (finalsState.finals.isEmpty) {
      return EmptyView(
        title: context.s.you_dont_have_finals,
        subtitle: context.s.it_seems_that_you_dont_have_any_final_exams_yet,
        onRefresh: () async {
          await finalsVM.getFinalExams();
        },
      );
    }

    return const FinalsList();
  }
}

class FinalsList extends ConsumerWidget {
  const FinalsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final finalsVM = ref.read(finalsViewModelProvider.notifier);

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
          final isToday = date.day == today.day &&
              date.month == today.month &&
              date.year == today.year;

          return DateExamRow(
            date: date,
            exams: exams,
            isToday: isToday,
          );
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
      padding: const EdgeInsets.symmetric(vertical: Constants.spacing),
      color:
          isToday ? context.colorScheme.primaryContainer : Colors.transparent,
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
  final bool isToday;

  const DateColumn({
    super.key,
    required this.date,
    this.isToday = false,
  });

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;

    return SizedBox(
      width: 60,
      child: Column(
        children: [
          Text(
            intl.DateFormat('EE', locale).format(date),
            style: context.textTheme.titleMedium,
          ),
          Text(
            intl.DateFormat('dd', locale).format(date),
            style: context.textTheme.headlineSmall,
          ),
          Text(
            intl.DateFormat('MMM', locale).format(date),
            style: context.textTheme.titleSmall,
          ),
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: exams.map((exam) => ExamDetailCard(exam: exam)).toList(),
      ),
    );
  }
}

class ExamDetailCard extends StatelessWidget {
  final FinalExam exam;

  const ExamDetailCard({
    super.key,
    required this.exam,
  });

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    final examDate = intl.DateFormat('EEEE, MMMM d', locale).format(
      exam.examDate,
    );
    final examTime = exam.examTime.format(context);

    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(Constants.spacing),
      child: Padding(
        padding: const EdgeInsets.all(Constants.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              exam.courseName,
              style: context.textTheme.titleLarge,
            ),
            const SizedBox(height: Constants.spacing),
            Text(
              exam.courseCode,
              style: context.textTheme.titleMedium,
            ),
            const SizedBox(height: Constants.spacing),
            Text(
              '${context.s.room_colon} ${exam.examRoom}',
              style: context.textTheme.titleSmall,
            ),
            Text(
              '${context.s.date_colon} $examDate',
              style: context.textTheme.titleSmall,
            ),
            Text(
              '${context.s.time_colon} $examTime',
              style: context.textTheme.titleSmall,
            ),
            const SizedBox(height: Constants.padding),
            CountdownTimerWidget(exam.examDate),
          ],
        ),
      ),
    );
  }
}
