import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/models/absence.dart';
import 'package:alyamamah/ui/views/absences/absence_details_list_tile.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AbsenceDetailsView extends StatelessWidget {
  final Absence absence;

  const AbsenceDetailsView({
    super.key,
    required this.absence,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.s.absence_details,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: ListView.separated(
        itemCount: absence.details.length,
        itemBuilder: (BuildContext context, int index) {
          final absenceDetails = absence.details[index];

          return AbsenceDetailsListTile(absenceDetails: absenceDetails);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: Constants.spacing,
          );
        },
      ),
    );
  }
}
