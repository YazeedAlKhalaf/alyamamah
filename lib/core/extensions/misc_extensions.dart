import 'package:alyamamah/core/models/day.dart';
import 'package:alyamamah/ui/views/courses/models/schedule_entry.dart';

extension MapDayScheduleEntriesExtension on Map<Day, List<ScheduleEntry>> {
  List<ScheduleEntry> toFlatList() {
    final flatList = <ScheduleEntry>[];
    forEach((day, scheduleEntries) {
      flatList.addAll(scheduleEntries);
    });

    return flatList;
  }
}
