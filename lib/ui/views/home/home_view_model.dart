// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:alyamamah/core/extensions/time_of_day.dart';
import 'package:alyamamah/core/models/day.dart';
import 'package:alyamamah/core/models/schedule.dart';
import 'package:alyamamah/core/models/time_table.dart';
import 'package:alyamamah/core/services/api/api_service.dart';
import 'package:alyamamah/core/services/api/api_service_exception.dart';
import 'package:alyamamah/ui/views/home/models/schedule_entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

final homeViewModelProvider = ChangeNotifierProvider(
  (ref) => HomeViewModel(
    apiService: ref.read(apiServiceProvider),
    pageController: PageController(),
  ),
);

class HomeViewModel extends ChangeNotifier {
  final _log = Logger('HomeViewModel');

  final ApiService _apiService;
  final PageController _pageController;

  HomeViewModel({
    required ApiService apiService,
    required PageController pageController,
  })  : _apiService = apiService,
        _pageController = pageController;

  bool _isBusy = false;
  bool get isBusy => _isBusy;

  PageController get pageController => _pageController;

  Map<Day, List<ScheduleEntry>> scheduleDays = {
    Day.sun: [],
    Day.mon: [],
    Day.tue: [],
    Day.wed: [],
    Day.thu: [],
  };

  Future<void> getStudentSchedule() async {
    _isBusy = true;
    notifyListeners();

    scheduleDays[Day.sun] = [];
    scheduleDays[Day.mon] = [];
    scheduleDays[Day.tue] = [];
    scheduleDays[Day.wed] = [];
    scheduleDays[Day.thu] = [];

    try {
      final scheduleList = await _apiService.getStudentSchedule(
        // TODO: make this dynamic.
        schedule: '20222',
      );

      // Arrange data.
      for (Schedule schedule in scheduleList) {
        for (TimeTable timeTable in schedule.timeTable) {
          for (Day day in timeTable.days) {
            scheduleDays[day]!.add(ScheduleEntry(
              startTime: timeTable.startTime,
              endTime: timeTable.endTime,
              room: timeTable.room,
              activityDesc: schedule.activityDesc,
              courseName: schedule.courseName,
            ));
          }
        }
      }

      // Sort data.
      scheduleDays.forEach((day, scheduleEntryList) {
        scheduleDays[day] = scheduleEntryList
          ..sort((a, b) => a.endTime.compareTo(b.startTime));
      });
    } on ApiServiceException catch (e) {
      _log.severe('getStudentSchedule() | exception: $e');
    }

    _isBusy = false;
    notifyListeners();
  }
}
