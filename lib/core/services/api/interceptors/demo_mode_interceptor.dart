import 'dart:convert';

import 'package:alyamamah/core/services/api/fixtures/absences_response.dart';
import 'package:alyamamah/core/services/api/fixtures/acitivity_courses.dart';
import 'package:alyamamah/core/services/api/fixtures/actor_details_response.dart';
import 'package:alyamamah/core/services/api/fixtures/course_results_response.dart';
import 'package:alyamamah/core/services/api/fixtures/do_registration_response.dart';
import 'package:alyamamah/core/services/api/fixtures/get_attempted_courses_response.dart';
import 'package:alyamamah/core/services/api/fixtures/get_registration_hours_response.dart';
import 'package:alyamamah/core/services/api/fixtures/offered_courses_response.dart';
import 'package:alyamamah/core/services/api/fixtures/student_gpa_response.dart';
import 'package:alyamamah/core/services/api/fixtures/student_schedule_response.dart';
import 'package:dio/dio.dart';

class DemoModeInterceptor extends Interceptor {
  bool _isInDemo = false;
  void disableDemoMode() {
    _isInDemo = false;
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    tryDemoActivation(options);

    if (_isInDemo) {
      final fakeResponse = getFakeResponse(options);
      if (fakeResponse == null) {
        throw Exception(
          'entered demo mode, but the path ${options.path} is not handled with a fake response.',
        );
      }

      handler.resolve(fakeResponse);
      return;
    }

    handler.next(options);
  }

  void tryDemoActivation(RequestOptions options) {
    const activationUsername = '200011150';
    const activationPassword = 'Aa1234aa@';
    const activationPath =
        '/resources/common/commonServies/actorDetails/-1/1/2';

    final encodedCredentials = base64Encode(
      utf8.encode('$activationUsername:$activationPassword'),
    );

    if (options.path == activationPath &&
        options.headers['Authorization'] == 'Basic $encodedCredentials') {
      _isInDemo = true;
    }
  }

  Response? getFakeResponse(RequestOptions options) {
    if (options.path
        .contains('/resources/common/commonServies/changeLanguage/')) {
      return Response<Map<String, dynamic>>(
        requestOptions: options,
        statusCode: 200,
        data: <String, dynamic>{},
      );
    }

    switch (options.path) {
      case '/resources/common/commonServies/actorDetails/-1/1/2':
        return Response(
          requestOptions: options,
          statusCode: 200,
          data: actorDetailsSuccessResponse,
        );
      case '/resources/student/schedule/studentSchedule/20221':
        return Response(
          requestOptions: options,
          statusCode: 200,
          data: studentSchedule20221SuccessResponse,
        );
      case '/resources/student/schedule/studentSchedule/20222':
        return Response(
          requestOptions: options,
          statusCode: 200,
          data: studentSchedule20222SuccessResponse,
        );
      case '/resources/student/absences/absences':
        return Response(
          requestOptions: options,
          statusCode: 200,
          data: absencesSuccessResponse,
        );
      case '/resources/student/coursesResults/getStudentGPA/20221':
        return Response(
          requestOptions: options,
          statusCode: 200,
          data: studentGpa20221SuccessResponse,
        );
      case '/resources/student/coursesResults/getCoursesResults/20221':
        return Response(
          requestOptions: options,
          statusCode: 200,
          data: courseResults20221SuccessResponse,
        );
      case '/resources/student/coursesResults/getStudentGPA/20222':
        return Response(
          requestOptions: options,
          statusCode: 200,
          data: studentGpa20222SuccessResponse,
        );
      case '/resources/student/coursesResults/getCoursesResults/20222':
        return Response(
          requestOptions: options,
          statusCode: 200,
          data: courseResults20222SuccessResponse,
        );
      case '/resources/student/reg/offeredCourses':
        return Response(
          requestOptions: options,
          statusCode: 200,
          data: offeredCoursesSuccessResponse,
        );
      case '/resources/student/reg/getAttemptedCourses':
        return Response(
          requestOptions: options,
          statusCode: 200,
          data: getAttemptedCoursesSuccessResponse,
        );
      case '/resources/student/reg/getRegHrs':
        return Response(
          requestOptions: options,
          statusCode: 200,
          data: getRegistrationHoursSuccessResponse,
        );
      case '/resources/student/reg/doRegistration':
        return Response(
          requestOptions: options,
          statusCode: 200,
          data: doRegistrationSuccessResponse,
        );
      case '/resources/student/reg/activityCourses':
        return Response(
          requestOptions: options,
          statusCode: 200,
          data: activityCoursesSuccessResponse,
        );
    }
    return null;
  }
}
