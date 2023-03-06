import 'dart:convert';

import 'package:alyamamah/core/services/api/fixtures/absences_response.dart';
import 'package:alyamamah/core/services/api/fixtures/actor_details_response.dart';
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
    if (options.path.contains('/resources/student/schedule/studentSchedule/')) {
      return Response<List<dynamic>>(
        requestOptions: options,
        statusCode: 200,
        data: studentScheduleSuccessResponse,
      );
    }

    switch (options.path) {
      case '/resources/common/commonServies/actorDetails/-1/1/2':
        return Response(
          requestOptions: options,
          statusCode: 200,
          data: actorDetailsSuccessResponse,
        );
      case '/resources/student/absences/absences':
        return Response(
          requestOptions: options,
          statusCode: 200,
          data: absencesSuccessResponse,
        );
    }

    return null;
  }
}
