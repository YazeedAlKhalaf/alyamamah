import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/extensions/misc_extensions.dart';
import 'package:alyamamah/ui/views/absences/absences_view_model.dart';
import 'package:alyamamah/ui/views/courses/courses_view_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

const dnPercentage = 20.0;

@RoutePage()
class AbsencesView extends ConsumerStatefulWidget {
  static final Key refreshIndicatorKey = UniqueKey();

  const AbsencesView({super.key});

  @override
  ConsumerState<AbsencesView> createState() => _AbsencesViewState();
}

class _AbsencesViewState extends ConsumerState<AbsencesView> {
  @override
  void initState() {
    super.initState();
    Future(() async {
      await ref.read(absencesViewModelProvider).getAbsences();
    });
  }

  @override
  Widget build(BuildContext context) {
    final absencesViewModel = ref.watch(absencesViewModelProvider);
    final coursesViewModel = ref.watch(coursesViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.s.absences),
      ),
      body: Column(
        children: [
          if (absencesViewModel.isBusy)
            const Center(child: CircularProgressIndicator())
          else if (!absencesViewModel.isBusy &&
              absencesViewModel.absences.isEmpty)
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  await ref.read(absencesViewModelProvider).getAbsences();
                },
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    const SizedBox(height: Constants.spacing * 4),
                    SvgPicture.asset(
                      'assets/vectors/undraw_awesome_rlvy.svg',
                      width: 200,
                    ),
                    const SizedBox(height: Constants.spacing * 4),
                    Text(
                      context.s.no_absences,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: Constants.spacing * 4),
                    Text(
                      context.s.no_absences_description,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            )
          else
            Expanded(
              child: RefreshIndicator(
                key: AbsencesView.refreshIndicatorKey,
                onRefresh: () async {
                  await ref.read(absencesViewModelProvider).getAbsences();
                },
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: absencesViewModel.absences.length,
                  itemBuilder: (BuildContext context, int index) {
                    final absence = absencesViewModel.absences[index];

                    final percentage = double.tryParse(
                          absence.totalAbsencePercent,
                        ) ??
                        0;

                    final classes = coursesViewModel.scheduleDays.toFlatList();
                    final scheduleEntries = classes.where((scheduleEntry) {
                      return scheduleEntry.courseCode == absence.courseCode;
                    }).toList();
                    final creditHours = int.parse(
                      scheduleEntries.first.creditHours,
                    );
                    // make this calculate the absences correctly.
                    // each course credit hours multipled
                    // by the number of its occurence per week muliplied
                    // by the number of weeks in the current semester.
                    final totalHours =
                        creditHours * scheduleEntries.length * 19;
                    final dnHoursThreshold = totalHours * (dnPercentage / 100);
                    final numberOfAbsences = absence.details.length;
                    final dnAbsencesCount =
                        (dnHoursThreshold / creditHours).floor();
                    final remainingAbsencesCount =
                        dnAbsencesCount - numberOfAbsences;

                    return ListTile(
                      leading: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox.square(
                            dimension: 25,
                            child: CircularProgressIndicator(
                              value: percentage / dnPercentage,
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.3),
                            ),
                          ),
                          const SizedBox(height: Constants.spacing),
                          Text(
                            '${absence.totalAbsencePercent}%',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      title: Text(absence.courseName),
                      isThreeLine: true,
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${context.s.absences_count(numberOfAbsences)}/$remainingAbsencesCount',
                          ),
                          Text(context.s.late_count(absence.countLate)),
                        ],
                      ),
                      trailing: const Icon(Icons.chevron_right_rounded),
                      onTap: () async {
                        await ref
                            .read(absencesViewModelProvider)
                            .navigateToAbsenceDetails(absence);
                      },
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
