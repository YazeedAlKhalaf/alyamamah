import 'dart:convert';
import 'dart:io';

import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/models/day.dart';
import 'package:alyamamah/core/models/ios_widget_course.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_widget/home_widget.dart';

final widgetKitSerivceProvider = Provider(
  (ref) => WidgetKitService(),
);

class WidgetKitService {
  WidgetKitService() {
    Future(() async {
      await HomeWidget.setAppGroupId(Constants.sharedAppGroup);
    });
  }

  Future<void> reloadCoursesWidget() async {
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
  }

  Future<void> updateCoursesWidgetData(
    Map<Day, List<IosWidgetCourse>> iosWidgetCoursesDays,
  ) async {
    if (!Platform.isIOS) return;

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
  }

  Future<void> deleteCoursesWidgetData() async {
    if (!Platform.isIOS) return;

    await HomeWidget.saveWidgetData(
      Constants.coursesWidgetDataKey,
      null,
    );
    await reloadCoursesWidget();
  }
}
