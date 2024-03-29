import 'dart:convert';
import 'dart:io';

import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/string.dart';
import 'package:alyamamah/core/models/absence.dart';
import 'package:alyamamah/core/models/actor_details.dart';
import 'package:alyamamah/core/models/course_result.dart';
import 'package:alyamamah/core/models/do_registration_response.dart';
import 'package:alyamamah/core/models/final_exam.dart';
import 'package:alyamamah/core/models/offered_course.dart';
import 'package:alyamamah/core/models/registration_hours.dart';
import 'package:alyamamah/core/models/schedule.dart';
import 'package:alyamamah/core/models/student_gpa.dart';
import 'package:alyamamah/core/providers/cookie_jar/cookie_jar_provider.dart';
import 'package:alyamamah/core/services/api/api_service_exception.dart';
import 'package:alyamamah/core/services/api/interceptors/demo_mode_interceptor.dart';
import 'package:alyamamah/core/services/api/interceptors/language_interceptor.dart';
import 'package:alyamamah/core/services/api/interceptors/session_expired_interceptor.dart';
import 'package:alyamamah/core/services/shared_prefs/shared_prefs_service.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:html/parser.dart' as parser;
import 'package:intl/intl.dart' as intl;
import 'package:logging/logging.dart';
import 'package:sentry_dio/sentry_dio.dart';

final apiServiceProvider = Provider(
  (ref) {
    final dio = Dio();

    if (!kIsWeb && Platform.isAndroid) {
      (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
        final client = HttpClient();
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;

        return client;
      };
    }

    return ApiService(
      dio: dio,
      cookieJar: ref.read(cookieJarProvider),
      demoModeInterceptor: DemoModeInterceptor(),
      sessionExpiredInterceptor: SessionExpiredInterceptor(
        sharedPrefsService: ref.read(sharedPrefsServiceProvider),
      ),
      languageInterceptor: LanguageInterceptor(
        sharedPrefsService: ref.read(sharedPrefsServiceProvider),
      ),
    );
  },
);

enum ChangeLanguageLocale {
  arabic(1),
  english(2);

  final int localeNumber;
  const ChangeLanguageLocale(this.localeNumber);
}

class ApiService {
  final _log = Logger('ApiService');

  final Dio _dio;
  final CookieJar _cookieJar;
  final DemoModeInterceptor _demoModeInterceptor;
  final SessionExpiredInterceptor _sessionExpiredInterceptor;
  final LanguageInterceptor _languageInterceptor;

  ApiService({
    required Dio dio,
    required CookieJar cookieJar,
    required DemoModeInterceptor demoModeInterceptor,
    required SessionExpiredInterceptor sessionExpiredInterceptor,
    required LanguageInterceptor languageInterceptor,
  })  : _dio = dio,
        _cookieJar = cookieJar,
        _demoModeInterceptor = demoModeInterceptor,
        _sessionExpiredInterceptor = sessionExpiredInterceptor,
        _languageInterceptor = languageInterceptor {
    _dio.options = BaseOptions(
      baseUrl: Constants.apiUrl,
      responseType: ResponseType.json,
    );

    /// This interceptor has an activation path and activation credentials,
    /// once triggered it will start faking all responses. This is useful for
    /// testing purposes.
    _dio.interceptors.add(_demoModeInterceptor);

    /// This interceptor is used to handle session expired errors automatically.
    /// It renews the session and retries the request.
    /// This should be before CookieManager because it needs to intercept the
    /// response before the cookie is saved, otherwise it will save the old
    /// cookie and the next request will fail.
    _dio.interceptors.add(_sessionExpiredInterceptor);

    /// This line makes cookies easier to deal with.
    /// Basically once you login, the server will send you a cookie
    /// that you can use to authenticate yourself in the future and this
    /// line makes it so that the cookie is automatically saved and sent
    /// with every request.
    ///
    /// DON'T USE WITH WEB!
    if (!kIsWeb) {
      _dio.interceptors.add(CookieManager(_cookieJar));
    }

    _dio.interceptors.add(_languageInterceptor);

    /// This must be the last step always.
    _dio.addSentry();
  }

  Future<ActorDetails> login({
    required String username,
    required String password,
  }) async {
    try {
      final encodedCredentials = base64Encode(
        utf8.encode('$username:$password'),
      );

      final response = await _dio.get(
        '/resources/common/commonServies/actorDetails/-1/1/2',
        options: Options(
          headers: {
            'Authorization': 'Basic $encodedCredentials',
          },
        ),
      );

      if (response.statusCode != 200) {
        _log.severe('login | non 200 status code.');
        throw const ApiServiceException();
      }

      if (response.data['commonInfo']['status'] == false) {
        _log.severe('login | invalid credentials.');
        throw const ApiServiceException(
          ApiServiceExceptionType.invalidCredentials,
        );
      }

      return ActorDetails.fromMap(response.data);
    } catch (e) {
      if (e is ApiServiceException) rethrow;

      _log.severe('login | unexpected exception: $e.');
      throw const ApiServiceException();
    }
  }

  Future<List<Schedule>> getStudentSchedule({
    required String schedule,
  }) async {
    try {
      final response = await _dio.get(
        '/resources/student/schedule/studentSchedule/$schedule',
      );

      if (response.statusCode != 200) {
        _log.severe('getStudentSchedule | non 200 status code.');
        throw const ApiServiceException();
      }

      return (response.data as List<dynamic>)
          .map((x) => Schedule.fromMap(x))
          .toList();
    } catch (e) {
      if (e is ApiServiceException) rethrow;

      _log.severe('getStudentSchedule | unexpected exception: $e.');
      throw const ApiServiceException();
    }
  }

  Future<void> logout() async {
    await _cookieJar.deleteAll();
    _demoModeInterceptor.disableDemoMode();
  }

  Future<List<Absence>> getAbsences() async {
    try {
      final response = await _dio.get(
        '/resources/student/absences/absences',
      );

      if (response.statusCode != 200) {
        _log.severe('getAbsences | non 200 status code.');
        throw const ApiServiceException();
      }

      return (response.data as List<dynamic>)
          .map((x) => Absence.fromMap(x))
          .toList();
    } catch (e) {
      if (e is ApiServiceException) rethrow;

      _log.severe('getAbsences | unexpected exception: $e.');
      throw const ApiServiceException();
    }
  }

  /// returns if the user is logged in or not.
  Future<bool> changeLanguage({
    required ChangeLanguageLocale changeLanguageLocale,
  }) async {
    try {
      final response = await _dio.get(
        '/resources/common/commonServies/changeLanguage/${changeLanguageLocale.localeNumber}',
        options: Options(
          headers: {
            'langId': '${changeLanguageLocale.localeNumber - 1}',
          },
        ),
      );

      if (response.statusCode != 200) {
        _log.severe('changeLanguage | non 200 status code.');
        throw const ApiServiceException();
      }

      return response.data is Map<String, dynamic>;
    } catch (e) {
      if (e is ApiServiceException) rethrow;

      _log.severe('changeLanguage | unexpected exception: $e.');
      throw const ApiServiceException();
    }
  }

  Future<void> updateStudentInfo({
    required String email,
    required String mobile,
  }) async {
    try {
      final response = await _dio.post(
        '/resources/student/contacts/updateStudentInfo',
        data: {
          'email': email,
          'mobile': mobile,
        },
      );

      if (response.statusCode != 200) {
        _log.severe('updateMobile | non 200 status code.');
        throw const ApiServiceException();
      }

      if (response.data.toString() != 'true') {
        _log.severe('updateMobile | failed to update student info.');
        throw const ApiServiceException(
          ApiServiceExceptionType.unknown,
        );
      }
    } catch (e) {
      if (e is ApiServiceException) rethrow;

      _log.severe('updateMobile | unexpected exception: $e.');
      throw const ApiServiceException();
    }
  }

  /// Somehow their API doesn't return the new data unless you call this thingy
  /// with the language you want, seems a session issue.
  /// Usually called with the same language as the app's current language.
  Future<ActorDetails> getActorDetails({
    required ChangeLanguageLocale changeLanguageLocale,
  }) async {
    try {
      final response = await _dio.get(
        '/resources/common/commonServies/changeLanguage/${changeLanguageLocale.localeNumber}',
        options: Options(
          headers: {
            'langId': '${changeLanguageLocale.localeNumber - 1}',
          },
        ),
      );

      if (response.statusCode != 200) {
        _log.severe('changeLanguage | non 200 status code.');
        throw const ApiServiceException();
      }

      final data = response.data;

      return ActorDetails.fromMap(data);
    } catch (e) {
      if (e is ApiServiceException) rethrow;

      _log.severe('changeLanguage | unexpected exception: $e.');
      throw const ApiServiceException();
    }
  }

  Future<List<CourseResult>> getCoursesResults({
    required String semester,
  }) async {
    try {
      final response = await _dio.get(
        '/resources/student/coursesResults/getCoursesResults/$semester',
      );

      if (response.statusCode != 200) {
        _log.severe('getCourseResults | non 200 status code.');
        throw const ApiServiceException();
      }

      return (response.data as List<dynamic>)
          .map((x) => CourseResult.fromMap(x))
          .toList();
    } catch (e) {
      if (e is ApiServiceException) rethrow;

      _log.severe('getCourseResults | unexpected exception: $e.');
      throw const ApiServiceException();
    }
  }

  Future<StudentGPA> getStudentGPA({required String semester}) async {
    try {
      final response = await _dio.get(
        '/resources/student/coursesResults/getStudentGPA/$semester',
      );

      if (response.statusCode != 200) {
        _log.severe('getStudentGPA | non 200 status code.');
        throw const ApiServiceException();
      }

      if (response.data['semesterGPA'] == null ||
          response.data['cumGPA'] == null) {
        _log.severe('getStudentGPA | semesterGPA or cumGPA is null.');
        throw const ApiServiceException(
          ApiServiceExceptionType.noStudentGpaReturned,
        );
      }

      return StudentGPA.fromMap(response.data);
    } catch (e) {
      if (e is ApiServiceException) rethrow;

      _log.severe('getStudentGPA | unexpected exception: $e.');
      throw const ApiServiceException();
    }
  }

  Future<List<OfferedCourse>> getOfferedCourses() async {
    try {
      final response = await _dio.post(
        '/resources/student/reg/offeredCourses',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
        data: [],
      );

      if (response.statusCode != 200) {
        _log.severe('getOfferedCourses | non 200 status code.');
        throw const ApiServiceException();
      }

      return (response.data as List<dynamic>)
          .map((e) => OfferedCourse.fromMap(e))
          .toList();
    } catch (e) {
      if (e is ApiServiceException) rethrow;

      _log.severe('getOfferedCourses | unexpected exception: $e.');
      throw const ApiServiceException();
    }
  }

  Future<List<OfferedCourse>> getAttemptedCourses() async {
    try {
      final response = await _dio.get(
        '/resources/student/reg/getAttemptedCourses',
      );

      if (response.statusCode != 200) {
        _log.severe('getAttemptedCourses | non 200 status code.');
        throw const ApiServiceException();
      }

      return (response.data as List<dynamic>)
          .map((e) => OfferedCourse.fromMap(e))
          .toList();
    } catch (e) {
      if (e is ApiServiceException) rethrow;

      _log.severe('getAttemptedCourses | unexpected exception: $e.');
      throw const ApiServiceException();
    }
  }

  Future<RegistrationHours> getRegistrationHours() async {
    try {
      final response = await _dio.get(
        '/resources/student/reg/getRegHrs',
      );

      if (response.statusCode != 200) {
        _log.severe('getRegistrationHours | non 200 status code.');
        throw const ApiServiceException();
      }

      return RegistrationHours.fromMap(response.data);
    } catch (e) {
      if (e is ApiServiceException) rethrow;

      _log.severe('getRegistrationHours | unexpected exception: $e.');
      throw const ApiServiceException();
    }
  }

  Future<DoRegistrationResponse> doRegistration({
    required List<OfferedCourse> courses,
  }) async {
    try {
      final response = await _dio.post(
        '/resources/student/reg/doRegistration',
        data: courses.map((e) => e.toMap()).toList(),
      );

      if (response.statusCode != 200) {
        _log.severe('doRegistration | non 200 status code.');
        throw const ApiServiceException();
      }

      return DoRegistrationResponse.fromMap(response.data);
    } catch (e) {
      if (e is ApiServiceException) rethrow;

      _log.severe('doRegistration | unexpected exception: $e.');
      throw const ApiServiceException();
    }
  }

  Future<List<OfferedCourse>> getRelatedCourses({
    required OfferedCourse offeredCourse,
  }) async {
    try {
      final response = await _dio.post(
        '/resources/student/reg/activityCourses',
        data: offeredCourse.toMap(),
      );

      if (response.statusCode != 200) {
        _log.severe('doRegistration | non 200 status code.');
        throw const ApiServiceException();
      }

      return (response.data as List<dynamic>)
          .map((e) => OfferedCourse.fromMap(e))
          .toList();
    } catch (e) {
      if (e is ApiServiceException) rethrow;

      _log.severe('getRelatedCourses | unexpected exception: $e.');
      throw const ApiServiceException();
    }
  }

  Future<List<FinalExam>> getFinalExams() async {
    try {
      final response = await _dio.get(
        '/ui/student/final_exams/index/finalExamsIndex.faces',
      );

      if (response.statusCode != 200) {
        _log.severe('getFinalExams | non 200 status code.');
        throw const ApiServiceException();
      }

      final document = parser.parse(response.data);
      final table = document.querySelector('[id*="finalExamsTable"]');
      final exams = <FinalExam>[];

      if (table != null) {
        var rows = table.getElementsByTagName('tr');

        for (int i = 1; i < rows.length; i++) {
          final cells = rows[i].getElementsByTagName('td');

          final DateTime examDate;
          try {
            examDate = intl.DateFormat('dd-MM-yyyy').parse(
              cells[7].text.trim(),
            );
          } catch (e) {
            continue;
          }

          final TimeOfDay examTime;
          try {
            examTime = cells[5].text.trim().map24ToTimeOfDay();
          } catch (e) {
            continue;
          }

          final exam = FinalExam(
            courseCode: cells[0].text.trim(),
            courseName: cells[1].text.trim(),
            courseSection: cells[2].text.trim(),
            examRoom: cells[3].text.trim(),
            examDay: cells[4].text.trim(),
            examTime: examTime,
            examDate: examDate,
          );

          exams.add(exam);
        }
      }

      return exams;
    } catch (e) {
      if (e is ApiServiceException) rethrow;

      _log.severe('getFinalExams | unexpected exception: $e.');
      throw const ApiServiceException();
    }
  }
}
