import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/models/absence.dart';
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
        title: Text(context.s.absence_details),
      ),
      body: ListView.separated(
        itemCount: absence.details.length,
        itemBuilder: (BuildContext context, int index) {
          final details = absence.details[index];

          return ListTile(
            leading: Text(
              details.section,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            title: Text(details.activity),
            subtitle: Text('${details.date}\n${details.day}'),
            isThreeLine: true,
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(value: details.isExcused, onChanged: (_) {}),
                      Text(context.s.excused),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(value: details.late, onChanged: (_) {}),
                      Text(context.s.late),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
    );
  }
}
