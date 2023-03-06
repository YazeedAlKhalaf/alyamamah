import 'dart:convert';

import 'package:alyamamah/core/models/absence.dart';
import 'package:alyamamah/core/models/actor_details.dart';
import 'package:alyamamah/core/models/schedule.dart';
import 'package:alyamamah/core/services/api/api_service.dart';
import 'package:alyamamah/core/services/api/api_service_exception.dart';
import 'package:alyamamah/core/services/api/interceptors/demo_mode_interceptor.dart';
import 'package:alyamamah/core/services/api/interceptors/fixtures/absences_response.dart';
import 'package:alyamamah/core/services/api/interceptors/fixtures/actor_details_response.dart';
import 'package:alyamamah/core/services/api/interceptors/fixtures/student_schedule_response.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../test_utils/matchers/auth_header_options_matcher.dart';

void main() {
  group('apiServiceProvider |', () {
    test(
      'verify apiServiceProvider is Provider<ApiService>.',
      () {
        expect(apiServiceProvider, isA<Provider<ApiService>>());
      },
    );
  });

  group('ApiService |', () {
    late FakeInterceptors fakeInterceptors;
    late MockDio mockDio;
    late MockCookieJar mockCookieJar;
    late MockDemoModeInteceptor mockDemoModeInteceptor;
    late ApiService apiService;

    setUp(() {
      fakeInterceptors = FakeInterceptors();
      mockDio = MockDio();
      when(() => mockDio.interceptors).thenReturn(fakeInterceptors);

      mockCookieJar = MockCookieJar();
      mockDemoModeInteceptor = MockDemoModeInteceptor();

      apiService = ApiService(
        dio: mockDio,
        cookieJar: mockCookieJar,
        demoModeInterceptor: mockDemoModeInteceptor,
      );
    });

    group('login |', () {
      test(
        'should get an ActorDetails instance '
        'if the response is successful.',
        () async {
          const username = 'username';
          const password = 'password';
          final encodedCredentials = base64Encode(
            utf8.encode('$username:$password'),
          );

          when(
            () => mockDio.get(
              '/resources/common/commonServies/actorDetails/-1/1/2',
              options: captureAny(
                named: 'options',
                that: AuthHeaderOptionsMatcher(
                  headerValue: 'Basic $encodedCredentials',
                ),
              ),
            ),
          ).thenAnswer(
            (_) => Future.value(Response(
              requestOptions: RequestOptions(path: ''),
              statusCode: 200,
              data: actorDetailsSuccessResponse,
            )),
          );

          final result = await apiService.login(
            username: username,
            password: password,
          );
          expect(result, isA<ActorDetails>());

          verify(
            () => mockDio.get(
              '/resources/common/commonServies/actorDetails/-1/1/2',
              options: captureAny(
                named: 'options',
                that: AuthHeaderOptionsMatcher(
                  headerValue: 'Basic $encodedCredentials',
                ),
              ),
            ),
          ).called(1);
        },
      );

      test(
        'should throw an ApiServiceException with type unknown '
        'if the response status code is 400.',
        () async {
          const username = 'username';
          const password = 'password';
          final encodedCredentials = base64Encode(
            utf8.encode('$username:$password'),
          );

          when(
            () => mockDio.get(
              '/resources/common/commonServies/actorDetails/-1/1/2',
              options: captureAny(
                named: 'options',
                that: AuthHeaderOptionsMatcher(
                  headerValue: 'Basic $encodedCredentials',
                ),
              ),
            ),
          ).thenAnswer(
            (_) => Future.value(Response(
              requestOptions: RequestOptions(path: ''),
              statusCode: 400,
              data: actorDetailsSuccessResponse,
            )),
          );

          expect(
            () => apiService.login(
              username: username,
              password: password,
            ),
            throwsA(isA<ApiServiceException>().having(
              (e) => e.type,
              'type',
              ApiServiceExceptionType.unknown,
            )),
          );

          verify(
            () => mockDio.get(
              '/resources/common/commonServies/actorDetails/-1/1/2',
              options: captureAny(
                named: 'options',
                that: AuthHeaderOptionsMatcher(
                  headerValue: 'Basic $encodedCredentials',
                ),
              ),
            ),
          ).called(1);
        },
      );

      test(
        'should throw an ApiServiceException with type invalidCredentials '
        'if the response status code is 200.',
        () async {
          const username = 'username';
          const password = 'password';
          final encodedCredentials = base64Encode(
            utf8.encode('$username:$password'),
          );

          when(
            () => mockDio.get(
              '/resources/common/commonServies/actorDetails/-1/1/2',
              options: captureAny(
                named: 'options',
                that: AuthHeaderOptionsMatcher(
                  headerValue: 'Basic $encodedCredentials',
                ),
              ),
            ),
          ).thenAnswer(
            (_) => Future.value(Response(
              requestOptions: RequestOptions(path: ''),
              statusCode: 200,
              data: actorDetailsFailureResponse,
            )),
          );

          expect(
            () => apiService.login(
              username: username,
              password: password,
            ),
            throwsA(isA<ApiServiceException>().having(
              (e) => e.type,
              'type',
              ApiServiceExceptionType.invalidCredentials,
            )),
          );

          verify(
            () => mockDio.get(
              '/resources/common/commonServies/actorDetails/-1/1/2',
              options: captureAny(
                named: 'options',
                that: AuthHeaderOptionsMatcher(
                  headerValue: 'Basic $encodedCredentials',
                ),
              ),
            ),
          ).called(1);
        },
      );

      test(
        'should throw an ApiServiceException with type unknown '
        'if get request throws any exception.',
        () async {
          const username = 'username';
          const password = 'password';
          final encodedCredentials = base64Encode(
            utf8.encode('$username:$password'),
          );

          when(
            () => mockDio.get(
              '/resources/common/commonServies/actorDetails/-1/1/2',
              options: captureAny(
                named: 'options',
                that: AuthHeaderOptionsMatcher(
                  headerValue: 'Basic $encodedCredentials',
                ),
              ),
            ),
          ).thenThrow(Exception());

          expect(
            () => apiService.login(
              username: username,
              password: password,
            ),
            throwsA(isA<ApiServiceException>().having(
              (e) => e.type,
              'type',
              ApiServiceExceptionType.unknown,
            )),
          );

          verify(
            () => mockDio.get(
              '/resources/common/commonServies/actorDetails/-1/1/2',
              options: captureAny(
                named: 'options',
                that: AuthHeaderOptionsMatcher(
                  headerValue: 'Basic $encodedCredentials',
                ),
              ),
            ),
          ).called(1);
        },
      );
    });

    group('getStudentSchedule |', () {
      test(
        'should get list of schedule if response is successful.',
        () async {
          when(
            () => mockDio.get(
              '/resources/student/schedule/studentSchedule/20222',
            ),
          ).thenAnswer(
            (_) => Future.value(Response(
              requestOptions: RequestOptions(path: ''),
              statusCode: 200,
              data: studentScheduleSuccessResponse,
            )),
          );

          final response = await apiService.getStudentSchedule(
            schedule: '20222',
          );
          expect(
            response,
            studentScheduleSuccessResponse
                .map((x) => Schedule.fromMap(x))
                .toList(),
          );
        },
      );

      test(
        'should throw exception if response status code is not 200.',
        () async {
          when(
            () => mockDio.get(
              '/resources/student/schedule/studentSchedule/20222',
            ),
          ).thenAnswer(
            (_) => Future.value(Response(
              requestOptions: RequestOptions(path: ''),
              statusCode: 404,
              data: {},
            )),
          );

          expect(
            () async => await apiService.getStudentSchedule(schedule: '20222'),
            throwsA(isA<ApiServiceException>().having(
              (e) => e.type,
              'exception type',
              ApiServiceExceptionType.unknown,
            )),
          );
        },
      );

      test(
        'should throw exception of session expired '
        'if response data is a string and contains "/yu/init" '
        'and status code is 200.',
        () async {
          when(
            () => mockDio.get(
              '/resources/student/schedule/studentSchedule/20222',
            ),
          ).thenAnswer(
            (_) => Future.value(Response(
              requestOptions: RequestOptions(path: ''),
              statusCode: 200,
              data: "gg '/yu/init' gg",
            )),
          );

          expect(
            () async => await apiService.getStudentSchedule(schedule: '20222'),
            throwsA(isA<ApiServiceException>().having(
              (e) => e.type,
              'exception type',
              ApiServiceExceptionType.sessionExpired,
            )),
          );
        },
      );

      test(
        'should throw exception if get request throws.',
        () async {
          when(
            () => mockDio.get(
              '/resources/student/schedule/studentSchedule/20222',
            ),
          ).thenThrow(Exception());

          expect(
            () async => await apiService.getStudentSchedule(schedule: '20222'),
            throwsA(isA<ApiServiceException>().having(
              (e) => e.type,
              'exception type',
              ApiServiceExceptionType.unknown,
            )),
          );
        },
      );
    });

    group('logout |', () {
      test(
        'should delete all cookies in cookie jar.',
        () {
          when(() => mockCookieJar.deleteAll())
              .thenAnswer((_) => Future.value());

          apiService.logout();

          verify(() => mockCookieJar.deleteAll()).called(1);
        },
      );
    });

    group('getAbsences |', () {
      test(
        'should get list of absences if response is successful.',
        () async {
          when(
            () => mockDio.get(
              '/resources/student/absences/absences',
            ),
          ).thenAnswer(
            (_) => Future.value(Response(
              requestOptions: RequestOptions(path: ''),
              statusCode: 200,
              data: absencesSuccessResponse,
            )),
          );

          final response = await apiService.getAbsences();
          expect(
            response,
            absencesSuccessResponse.map((x) => Absence.fromMap(x)).toList(),
          );
        },
      );

      test(
        'should throw exception if response status code is not 200.',
        () async {
          when(
            () => mockDio.get(
              '/resources/student/absences/absences',
            ),
          ).thenAnswer(
            (_) => Future.value(Response(
              requestOptions: RequestOptions(path: ''),
              statusCode: 404,
              data: {},
            )),
          );

          expect(
            () async => await apiService.getAbsences(),
            throwsA(isA<ApiServiceException>().having(
              (e) => e.type,
              'exception type',
              ApiServiceExceptionType.unknown,
            )),
          );
        },
      );

      test(
        'should throw exception of session expired '
        'if response data is a string and contains "/yu/init" '
        'and status code is 200.',
        () async {
          when(
            () => mockDio.get(
              '/resources/student/absences/absences',
            ),
          ).thenAnswer(
            (_) => Future.value(Response(
              requestOptions: RequestOptions(path: ''),
              statusCode: 200,
              data: "gg '/yu/init' gg",
            )),
          );

          expect(
            () async => await apiService.getAbsences(),
            throwsA(isA<ApiServiceException>().having(
              (e) => e.type,
              'exception type',
              ApiServiceExceptionType.sessionExpired,
            )),
          );
        },
      );

      test(
        'should throw exception if get request throws.',
        () async {
          when(
            () => mockDio.get(
              '/resources/student/absences/absences',
            ),
          ).thenThrow(Exception());

          expect(
            () async => await apiService.getAbsences(),
            throwsA(isA<ApiServiceException>().having(
              (e) => e.type,
              'exception type',
              ApiServiceExceptionType.unknown,
            )),
          );
        },
      );
    });
  });
}

class FakeInterceptors extends Fake implements Interceptors {
  @override
  void add(Interceptor interceptor) {}
}

class MockDio extends Mock implements Dio {}

class MockCookieJar extends Mock implements CookieJar {}

class MockDemoModeInteceptor extends Mock implements DemoModeInterceptor {}
