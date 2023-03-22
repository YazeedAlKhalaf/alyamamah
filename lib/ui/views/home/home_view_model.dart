import 'package:alyamamah/core/extensions/time_of_day.dart';
import 'package:alyamamah/core/models/day.dart';
import 'package:alyamamah/core/models/ios_widget_course.dart';
import 'package:alyamamah/core/models/schedule.dart';
import 'package:alyamamah/core/models/time_table.dart';
import 'package:alyamamah/core/services/api/api_service.dart';
import 'package:alyamamah/core/services/api/api_service_exception.dart';
import 'package:alyamamah/core/services/shared_prefs/shared_prefs_service.dart';
import 'package:alyamamah/core/services/widget_kit/widget_kit_service.dart';
import 'package:alyamamah/ui/views/home/models/schedule_entry.dart';
import 'package:alyamamah/ui/views/home/models/time_mapping.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:logging/logging.dart';

final homeViewModelProvider = ChangeNotifierProvider(
  (ref) => HomeViewModel(
    apiService: ref.read(apiServiceProvider),
    pageController: PageController(),
    widgetKitService: ref.read(widgetKitSerivceProvider),
    sharedPrefsService: ref.read(sharedPrefsServiceProvider),
  ),
);

class HomeViewModel extends ChangeNotifier {
  final _log = Logger('HomeViewModel');

  final ApiService _apiService;
  final PageController _pageController;
  final WidgetKitService _widgetKitService;
  final SharedPrefsService _sharedPrefsService;

  HomeViewModel({
    required ApiService apiService,
    required PageController pageController,
    required WidgetKitService widgetKitService,
    required SharedPrefsService sharedPrefsService,
  })  : _apiService = apiService,
        _pageController = pageController,
        _widgetKitService = widgetKitService,
        _sharedPrefsService = sharedPrefsService {
    HijriCalendar now = HijriCalendar.now();

    _isRamadan =
        (now.isAfter(now.hYear, 4, 1) && now.isBefore(now.hYear, 5, 1)) ||
            (_sharedPrefsService.getRamadanMode() ?? false);
  }

  bool _isBusy = false;
  bool get isBusy => _isBusy;

  bool _isRamadan = false;
  bool get isRamadan => _isRamadan;

  PageController get pageController => _pageController;

  Map<Day, List<ScheduleEntry>> get scheduleDays =>
      isRamadan ? scheduleDaysRamadan : scheduleDaysRegular;

  Map<Day, List<ScheduleEntry>> scheduleDaysRegular = {
    Day.sun: [],
    Day.mon: [],
    Day.tue: [],
    Day.wed: [],
    Day.thu: [],
  };

  Map<Day, List<ScheduleEntry>> scheduleDaysRamadan = {
    Day.sun: [],
    Day.mon: [],
    Day.tue: [],
    Day.wed: [],
    Day.thu: [],
  };

  Future<void> getStudentSchedule() async {
    _isBusy = true;
    notifyListeners();

    scheduleDaysRegular[Day.sun] = [];
    scheduleDaysRegular[Day.mon] = [];
    scheduleDaysRegular[Day.tue] = [];
    scheduleDaysRegular[Day.wed] = [];
    scheduleDaysRegular[Day.thu] = [];

    try {
      final scheduleList = await _apiService.getStudentSchedule(
        // TODO: make this dynamic.
        schedule: '20222',
      );

      // Arrange data.
      for (Schedule schedule in scheduleList) {
        for (TimeTable timeTable in schedule.timeTable) {
          for (Day day in timeTable.days) {
            scheduleDaysRegular[day]!.add(ScheduleEntry(
              startTime: timeTable.startTime,
              endTime: timeTable.endTime,
              room: timeTable.room,
              activityDesc: schedule.activityDesc,
              courseName: schedule.courseName,
              courseCode: schedule.courseCode,
            ));

            Set<Day> days = timeTable.days;
            final response = convertToRamdanTime(
              days,
              timeTable.startTime,
              timeTable.endTime,
            );
            final startTime = response.startTime;
            final endTime = response.endTime;
            if (response.days.isNotEmpty) {
              days = response.days;
            }
            for (final e in days) {
              if (e == day) {
                scheduleDaysRamadan[day]!.add(ScheduleEntry(
                  startTime: startTime,
                  endTime: endTime,
                  room: timeTable.room,
                  activityDesc: schedule.activityDesc,
                  courseName: schedule.courseName,
                  courseCode: schedule.courseCode,
                ));
              }
            }
          }
        }
      }

      // Sort data.
      scheduleDaysRegular.forEach((day, scheduleEntryList) {
        scheduleDaysRegular[day] = scheduleEntryList
          ..sort((a, b) => a.endTime.compareTo(b.startTime));
      });
      scheduleDaysRamadan.forEach((day, scheduleEntryList) {
        scheduleDaysRamadan[day] = scheduleEntryList
          ..sort((a, b) => a.endTime.compareTo(b.startTime));
      });

      final iosWidgetCoursesDays = <Day, List<IosWidgetCourse>>{
        Day.sun: [],
        Day.mon: [],
        Day.tue: [],
        Day.wed: [],
        Day.thu: [],
      };

      // Convert data to ios widget data.
      if (isRamadan) {
        scheduleDaysRamadan.forEach((day, scheduleEntryList) {
          for (ScheduleEntry scheduleEntry in scheduleEntryList) {
            iosWidgetCoursesDays[day]!.add(IosWidgetCourse(
              startTime: scheduleEntry.startTime,
              endTime: scheduleEntry.endTime,
              roomName: scheduleEntry.room,
              courseCode: scheduleEntry.courseCode,
            ));
          }
        });
      } else {
        scheduleDaysRegular.forEach((day, scheduleEntryList) {
          for (ScheduleEntry scheduleEntry in scheduleEntryList) {
            iosWidgetCoursesDays[day]!.add(IosWidgetCourse(
              startTime: scheduleEntry.startTime,
              endTime: scheduleEntry.endTime,
              roomName: scheduleEntry.room,
              courseCode: scheduleEntry.courseCode,
            ));
          }
        });
      }

      await _widgetKitService.updateCoursesWidgetData(
        iosWidgetCoursesDays,
      );
    } on ApiServiceException catch (e) {
      _log.severe('getStudentSchedule() | exception: $e');
    } on PlatformException catch (e) {
      _log.severe('getStudentSchedule() | exception: $e');
    } on Exception catch (e) {
      _log.severe('getStudentSchedule() | exception: $e');
    }

    _isBusy = false;
    notifyListeners();
  }

  Future<void> toggleRamadanMode() async {
    _isRamadan = !isRamadan;
    notifyListeners();

    await _sharedPrefsService.saveRamadanMode(isRamadan);

    final iosWidgetCoursesDays = <Day, List<IosWidgetCourse>>{
      Day.sun: [],
      Day.mon: [],
      Day.tue: [],
      Day.wed: [],
      Day.thu: [],
    };

    // Convert data to ios widget data.
    if (isRamadan) {
      scheduleDaysRamadan.forEach((day, scheduleEntryList) {
        for (ScheduleEntry scheduleEntry in scheduleEntryList) {
          iosWidgetCoursesDays[day]!.add(IosWidgetCourse(
            startTime: scheduleEntry.startTime,
            endTime: scheduleEntry.endTime,
            roomName: scheduleEntry.room,
            courseCode: scheduleEntry.courseCode,
          ));
        }
      });
    } else {
      scheduleDaysRegular.forEach((day, scheduleEntryList) {
        for (ScheduleEntry scheduleEntry in scheduleEntryList) {
          iosWidgetCoursesDays[day]!.add(IosWidgetCourse(
            startTime: scheduleEntry.startTime,
            endTime: scheduleEntry.endTime,
            roomName: scheduleEntry.room,
            courseCode: scheduleEntry.courseCode,
          ));
        }
      });
    }

    await _widgetKitService.updateCoursesWidgetData(
      iosWidgetCoursesDays,
    );
  }
}
