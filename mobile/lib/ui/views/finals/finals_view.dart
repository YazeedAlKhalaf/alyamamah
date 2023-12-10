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
    List<DateTime> dates = List.generate(
      endDate.difference(startDate).inDays + 1,
      (index) => startDate.add(Duration(days: index)),
    );

    final Map<dynamic, List<FinalExam>> scheduleMap = {};
    DateTime? lastExamDate;

    for (var date in dates) {
      final exams = finalsVM.getExamsForDate(date);
      if (exams.isNotEmpty) {
        scheduleMap[date] = exams;
        lastExamDate = date;
      } else if (lastExamDate != null) {
        DateTime nextExamDate = dates.firstWhere(
          (d) => d.isAfter(date) && finalsVM.hasExamOnDate(d),
          orElse: () => endDate.add(const Duration(days: 1)),
        );
        if (nextExamDate.difference(date).inDays > 1) {
          String breakKey =
              '${date.toString()} - ${nextExamDate.subtract(const Duration(days: 1)).toString()}';
          scheduleMap[breakKey] = [];
          lastExamDate = null;
        }
      }
    }

    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(finalsViewModelProvider.notifier).getFinalExams();
      },
      child: ListView.builder(
        itemCount: scheduleMap.keys.length,
        itemBuilder: (context, index) {
          var key = scheduleMap.keys.elementAt(index);
          List<FinalExam> exams = scheduleMap[key]!;

          if (key is DateTime) {
            return DateExamRow(
              date: key,
              exams: exams,
              isToday: key.isAtSameMomentAs(DateTime.now()),
            );
          } else if (key is String) {
            final dates = key.split(' - ');
            DateTime start = DateTime.parse(dates[0]);
            DateTime end = DateTime.parse(dates[1]);
            return BreakIntervalTile(
              startDate: start,
              endDate: end,
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}

class BreakIntervalTile extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;

  const BreakIntervalTile({
    super.key,
    required this.startDate,
    required this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    final daysDifference = endDate.difference(startDate).inDays + 1;

    final locale = Localizations.localeOf(context).languageCode;
    final formattedStartDate = intl.DateFormat('EE, dd MMM', locale).format(
      startDate,
    );
    final formattedEndDate = intl.DateFormat('EE, dd MMM', locale).format(
      endDate,
    );

    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(
        horizontal: Constants.padding,
        vertical: Constants.spacing,
      ),
      color: context.colorScheme.primaryContainer,
      child: ListTile(
        isThreeLine: true,
        title: Text(
          context.s.break_word,
          style: context.textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              context.s.break_duration(daysDifference),
              style: context.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            Text(
              context.s.from_to(formattedStartDate, formattedEndDate),
              style: context.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
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
    final examDate = intl.DateFormat('EEEE, MMMM d, yyyy', locale).format(
      exam.examDate,
    );
    final examTime = exam.examTime.format(context);

    final combinedDateTime = DateTime(
      exam.examDate.year,
      exam.examDate.month,
      exam.examDate.day,
      exam.examTime.hour,
      exam.examTime.minute,
    );

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 5,
      margin: const EdgeInsets.all(Constants.spacing),
      child: Container(
        decoration: BoxDecoration(
          color: context.colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(Constants.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              exam.courseName,
              style: context.textTheme.titleLarge?.copyWith(
                color: context.colorScheme.primary,
              ),
            ),
            const SizedBox(height: Constants.spacing),
            Text(
              exam.courseCode,
              style: context.textTheme.titleMedium?.copyWith(
                color: context.colorScheme.secondary,
              ),
            ),
            const SizedBox(height: Constants.spacing),
            _buildDetailRow(
              Icons.location_on,
              '${context.s.room_colon} ${exam.examRoom}',
              context,
            ),
            const SizedBox(height: Constants.spacing),
            _buildDetailRow(
              Icons.calendar_today,
              '${context.s.date_colon} $examDate',
              context,
            ),
            const SizedBox(height: Constants.spacing),
            _buildDetailRow(
              Icons.access_time,
              '${context.s.time_colon} $examTime',
              context,
            ),
            const SizedBox(height: Constants.padding),
            CountdownTimerWidget(combinedDateTime),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String text, BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: context.colorScheme.onSurface, size: 20),
        const SizedBox(width: Constants.spacing),
        Text(
          text,
          style: context.textTheme.titleSmall?.copyWith(
            color: context.colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
