import 'package:alyamamah/ui/views/courses/models/schedule_entry.dart';

class Conflict {
  final ScheduleEntry firstEntry;
  final ScheduleEntry secondEntry;

  Conflict({
    required this.firstEntry,
    required this.secondEntry,
  });

  Conflict copyWith({
    ScheduleEntry? firstEntry,
    ScheduleEntry? secondEntry,
  }) {
    return Conflict(
      firstEntry: firstEntry ?? this.firstEntry,
      secondEntry: secondEntry ?? this.secondEntry,
    );
  }

  @override
  bool operator ==(covariant Conflict other) {
    if (identical(this, other)) return true;

    return other.firstEntry == firstEntry && other.secondEntry == secondEntry;
  }

  @override
  int get hashCode => firstEntry.hashCode ^ secondEntry.hashCode;
}
