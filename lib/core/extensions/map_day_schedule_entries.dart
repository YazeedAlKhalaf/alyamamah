import 'dart:convert';

import 'package:alyamamah/core/models/day.dart';
import 'package:alyamamah/ui/views/courses/models/schedule_entry.dart';

extension MapDayScheduleEntries on Map<Day, List<ScheduleEntry>> {
  String toJson() {
    final List<Map<String, dynamic>> list = entries
        .map((entry) => {
              'day': entry.key.toJson(),
              'scheduleEntries': entry.value.map((e) => e.toJson()).toList(),
            })
        .toList();

    return jsonEncode(list);
  }
}

Map<Day, List<ScheduleEntry>> mapDayScheduleEntriesFromJson(String jsonString) {
  List<dynamic> jsonList = jsonDecode(jsonString);

  final entries = <Day, List<ScheduleEntry>>{};

  for (var jsonEntry in jsonList) {
    if (jsonEntry is Map<String, dynamic>) {
      Day day = Day.fromJson(jsonEntry['day']);
      List<ScheduleEntry> scheduleEntries =
          (jsonEntry['scheduleEntries'] as List)
              .map<ScheduleEntry>((jsonScheduleEntry) {
        return ScheduleEntry.fromJson(jsonScheduleEntry);
      }).toList();

      entries[day] = scheduleEntries;
    }
  }

  return entries;
}
