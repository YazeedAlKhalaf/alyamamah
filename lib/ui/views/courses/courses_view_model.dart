import 'package:alyamamah/core/extensions/time_of_day.dart';
import 'package:alyamamah/core/models/day.dart';
import 'package:alyamamah/core/models/ios_widget_course.dart';
import 'package:alyamamah/core/models/schedule.dart';
import 'package:alyamamah/core/models/time_table.dart';
import 'package:alyamamah/core/providers/actor_details/actor_details_notifier.dart';
import 'package:alyamamah/core/router/yu_router.dart';
import 'package:alyamamah/core/services/api/api_service.dart';
import 'package:alyamamah/core/services/api/api_service_exception.dart';
import 'package:alyamamah/core/services/shared_prefs/shared_prefs_service.dart';
import 'package:alyamamah/core/services/widget_kit/widget_kit_service.dart';
import 'package:alyamamah/ui/views/courses/models/schedule_entry.dart';
import 'package:alyamamah/ui/views/courses/models/time_mapping.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:logging/logging.dart';

final coursesViewModelProvider = ChangeNotifierProvider(
  (ref) => CoursesViewModel(
    apiService: ref.read(apiServiceProvider),
    pageController: PageController(),
    widgetKitService: ref.read(widgetKitSerivceProvider),
    sharedPrefsService: ref.read(sharedPrefsServiceProvider),
    yuRouter: ref.read(yuRouterProvider),
    ref: ref,
  ),
);

class CoursesViewModel extends ChangeNotifier {
  final _log = Logger('CoursesViewModel');

  final ApiService _apiService;
  final PageController _pageController;
  final WidgetKitService _widgetKitService;
  final SharedPrefsService _sharedPrefsService;
  final YURouter _yuRouter;
  final Ref _ref;

  CoursesViewModel({
    required ApiService apiService,
    required PageController pageController,
    required WidgetKitService widgetKitService,
    required SharedPrefsService sharedPrefsService,
    required YURouter yuRouter,
    required Ref ref,
  })  : _apiService = apiService,
        _pageController = pageController,
        _widgetKitService = widgetKitService,
        _sharedPrefsService = sharedPrefsService,
        _yuRouter = yuRouter,
        _ref = ref {
    HijriCalendar now = HijriCalendar.now();

    _isRamadan =
        (now.isAfter(now.hYear, 4, 1) && now.isBefore(now.hYear, 5, 1)) ||
            (_sharedPrefsService.getRamadanMode() ?? false);
    _selectedSemester =
        _ref.read(actorDetailsProvider)?.semester.currentSemester ?? '';
  }

  bool _isBusy = false;
  bool get isBusy => _isBusy;

  bool _isRamadan = false;
  bool get isRamadan => _isRamadan;

  late String _selectedSemester;
  String get selectedSemester => _selectedSemester;

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

    scheduleDaysRamadan[Day.sun] = [];
    scheduleDaysRamadan[Day.mon] = [];
    scheduleDaysRamadan[Day.tue] = [];
    scheduleDaysRamadan[Day.wed] = [];
    scheduleDaysRamadan[Day.thu] = [];

    try {
      final scheduleList = await _apiService.getStudentSchedule(
        schedule: _selectedSemester,
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
              instructor: schedule.instructor,
              creditHours: schedule.crdHrs,
              campusName: schedule.campusName,
              courseDeleted: schedule.courseDeleted,
              section: schedule.sectionSeq,
            ));

            Set<Day> days = timeTable.days;
            final response = convertToRamdanTime(
              days,
              timeTable.startTime,
              timeTable.endTime,
              int.parse(schedule.sectionSeq),
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
                  instructor: schedule.instructor,
                  creditHours: schedule.crdHrs,
                  campusName: schedule.campusName,
                  courseDeleted: schedule.courseDeleted,
                  section: schedule.sectionSeq,
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

      // Cache data.
      await _sharedPrefsService.saveScheduleDays(scheduleDaysRegular);

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

      final scheduleDays = _sharedPrefsService.getScheduleDays();
      _log.info(
        'getStudentSchedule() | using cached data. does cached data exist? ${scheduleDays != null}',
      );
      if (scheduleDays != null) {
        scheduleDaysRegular = scheduleDays;
      }
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

  Future<void> navigateToCourseDetails(ScheduleEntry scheduleEntry) async {
    await _yuRouter.push(
      CourseDetailsRoute(scheduleEntry: scheduleEntry),
    );
  }

  Future<void> changeSemester(String newSemesterValue) async {
    if (_selectedSemester.isEmpty) return;

    _selectedSemester = newSemesterValue;
    notifyListeners();

    await getStudentSchedule();
  }
}
