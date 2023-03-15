import 'dart:convert';
import 'dart:io';

import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/models/day.dart';
import 'package:alyamamah/core/models/ios_widget_course.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widgetkit/flutter_widgetkit.dart';

final widgetKitSerivceProvider = Provider(
  (ref) => WidgetKitService(),
);

class WidgetKitService {
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

    await WidgetKit.setItem(
      Constants.coursesWidgetDataKey,
      json.encode(jsonMap),
      Constants.sharedAppGroup,
    );
    WidgetKit.reloadAllTimelines();
  }

  Future<void> deleteCoursesWidgetData() async {
    if (!Platform.isIOS) return;

    await WidgetKit.removeItem(
      Constants.coursesWidgetDataKey,
      Constants.sharedAppGroup,
    );
    WidgetKit.reloadAllTimelines();
  }
}
