import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/ui/views/absences/absences_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
            Center(
              child: Text(context.s.no_absences),
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

                    return ListTile(
                      leading: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox.square(
                            dimension: 25,
                            child: CircularProgressIndicator(
                              value: percentage / 20,
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
                      subtitle: Text(
                        context.s.absences_count(absence.countAbsence),
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
