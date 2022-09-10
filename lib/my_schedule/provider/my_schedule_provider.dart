// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:alyamamah/app/model/student_schedule_course.dart';
import 'package:alyamamah/app/model/timetable_entry.dart';
import 'package:alyamamah/app/repository/yamamah_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyScheduleState {
  final List<StudentScheduleCourse>? studentSchedule;
  final bool isLoading;
  final Day selectedDay;

  MyScheduleState({
    this.studentSchedule,
    this.isLoading = true,
    this.selectedDay = Day.sunday,
  });

  MyScheduleState copyWith({
    List<StudentScheduleCourse>? studentSchedule,
    bool? isLoading,
    Day? selectedDay,
  }) {
    return MyScheduleState(
      studentSchedule: studentSchedule ?? this.studentSchedule,
      isLoading: isLoading ?? this.isLoading,
      selectedDay: selectedDay ?? this.selectedDay,
    );
  }

  @override
  String toString() =>
      'MyScheduleState(studentSchedule: $studentSchedule, isLoading: $isLoading, selectedDay: $selectedDay)';

  @override
  bool operator ==(covariant MyScheduleState other) {
    if (identical(this, other)) return true;

    return listEquals(other.studentSchedule, studentSchedule) &&
        other.isLoading == isLoading &&
        other.selectedDay == selectedDay;
  }

  @override
  int get hashCode =>
      studentSchedule.hashCode ^ isLoading.hashCode ^ selectedDay.hashCode;
}

final myScheduleProvider =
    StateNotifierProvider<MyScheduleNotifier, MyScheduleState>(
  (ref) => MyScheduleNotifier(
    yamamahRepository: ref.read(yamamahRepositoryProvider),
  ),
);

class MyScheduleNotifier extends StateNotifier<MyScheduleState> {
  final YamamahRepository _yamamahRepository;

  MyScheduleNotifier({required YamamahRepository yamamahRepository})
      : _yamamahRepository = yamamahRepository,
        super(MyScheduleState(
          selectedDay: DateTime.now().dayFromWeekday,
        ));

  void setSelectedDay(Day day) {
    state = state.copyWith(selectedDay: day);
  }

  Future<void> getStudentSchedule() async {
    try {
      final studentSchedule = await _yamamahRepository.getStudentSchedule();

      state = state.copyWith(
        studentSchedule: studentSchedule,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
      );
      print(e);
    }
  }
}
