import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/ui/views/absences/absence_list_tile.dart';
import 'package:alyamamah/ui/views/absences/absences_view_model.dart';
import 'package:alyamamah/ui/widgets/empty_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.s.absences,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: [
          if (absencesViewModel.isBusy)
            const Center(child: CircularProgressIndicator())
          else if (!absencesViewModel.isBusy &&
              absencesViewModel.absences.isEmpty)
            Expanded(
              child: EmptyView(
                title: context.s.no_absences,
                subtitle: context.s.no_absences_description,
                onRefresh: () async {
                  await ref.read(absencesViewModelProvider).getAbsences();
                },
              ),
            )
          else
            Expanded(
              child: RefreshIndicator(
                key: AbsencesView.refreshIndicatorKey,
                onRefresh: () async {
                  await ref.read(absencesViewModelProvider).getAbsences();
                },
                child: ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: absencesViewModel.absences.length,
                  itemBuilder: (BuildContext context, int index) {
                    final absence = absencesViewModel.absences[index];

                    return AbsenceListTile(absence: absence);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: Constants.spacing,
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
