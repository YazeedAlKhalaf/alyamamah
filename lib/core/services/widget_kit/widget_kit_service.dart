import 'dart:convert';

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
    await WidgetKit.removeItem(
      Constants.coursesWidgetDataKey,
      Constants.sharedAppGroup,
    );
    WidgetKit.reloadAllTimelines();
  }
}
