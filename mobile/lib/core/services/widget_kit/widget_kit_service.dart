import 'dart:convert';

import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/models/day.dart';
import 'package:alyamamah/core/models/ios_widget_course.dart';
import 'package:alyamamah/core/services/widget_kit/widget_kit_service_exception.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_widget/home_widget.dart';
import 'package:logging/logging.dart';

final widgetKitSerivceProvider = Provider(
  (ref) => WidgetKitService(),
);

class WidgetKitService {
  final _log = Logger('WidgetKitService');

  WidgetKitService() {
    Future(() async {
      await HomeWidget.setAppGroupId(Constants.sharedAppGroup);
    });
  }

  Future<void> reloadCoursesWidget() async {
    try {
      await HomeWidget.updateWidget(
        androidName: 'CoursesWidget',
        iOSName: 'CoursesWidget',
      );

      // no keyguard widget on android,
      // so i am updating the accessory widget only.
      await HomeWidget.updateWidget(
        androidName: 'CoursesWidget',
        iOSName: 'CoursesAccessoryWidget',
      );
    } on PlatformException catch (e) {
      _log.severe('failed to reloadCoursesWidget using updateWidget: $e');

      throw const WidgetKitServiceException(
        WidgetKitServiceExceptionType.failedToReloadWidget,
      );
    }
  }

  Future<void> updateCoursesWidgetData(
    Map<Day, List<IosWidgetCourse>> iosWidgetCoursesDays,
  ) async {
    try {
      Map<String, dynamic> jsonMap = {};
      for (Day day in iosWidgetCoursesDays.keys) {
        final coursesJson = iosWidgetCoursesDays[day]!.map((course) {
          return course.toMap();
        }).toList();
        jsonMap[day.name] = coursesJson;
      }

      await HomeWidget.saveWidgetData<String>(
        Constants.coursesWidgetDataKey,
        json.encode(jsonMap),
      );
      await reloadCoursesWidget();
    } on PlatformException catch (e) {
      _log.severe('failed to updateCoursesWidgetData using saveWidgetData: $e');

      throw const WidgetKitServiceException(
        WidgetKitServiceExceptionType.failedToSaveWidgetData,
      );
    }
  }

  Future<void> deleteCoursesWidgetData() async {
    try {
      await HomeWidget.saveWidgetData(
        Constants.coursesWidgetDataKey,
        null,
      );
      await reloadCoursesWidget();
    } on PlatformException catch (e) {
      _log.severe('failed to deleteCoursesWidgetData using saveWidgetData: $e');

      throw const WidgetKitServiceException(
        WidgetKitServiceExceptionType.failedToDeleteWidgetData,
      );
    }
  }
}
