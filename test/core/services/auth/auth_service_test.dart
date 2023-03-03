import 'dart:convert';

import 'package:alyamamah/core/models/actor_details.dart';
import 'package:alyamamah/core/models/schedule.dart';
import 'package:alyamamah/core/services/auth/auth_service.dart';
import 'package:alyamamah/core/services/auth/auth_service_exception.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../test_utils/matchers/auth_header_options_matcher.dart';
import 'fixtures/actor_details_response.dart';
import 'fixtures/student_schedule_response.dart';

void main() {
  group('authServiceProvider |', () {
    test(
      'verify authServiceProvider is Provider<AuthService>.',
      () {
        expect(authServiceProvider, isA<Provider<AuthService>>());
      },
    );
  });

  group('AuthService |', () {
    late FakeInterceptors fakeInterceptors;
    late MockDio mockDio;
    late MockCookieJar mockCookieJar;
    late AuthService authService;

    setUp(() {
      fakeInterceptors = FakeInterceptors();
      mockDio = MockDio();
      when(() => mockDio.interceptors).thenReturn(fakeInterceptors);

      mockCookieJar = MockCookieJar();

      authService = AuthService(
        dio: mockDio,
        cookieJar: mockCookieJar,
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

          final result = await authService.login(
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
        'should throw an AuthServiceException with type unknown '
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
            () => authService.login(
              username: username,
              password: password,
            ),
            throwsA(isA<AuthServiceException>().having(
              (e) => e.type,
              'type',
              AuthServiceExceptionType.unknown,
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
        'should throw an AuthServiceException with type invalidCredentials '
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
            () => authService.login(
              username: username,
              password: password,
            ),
            throwsA(isA<AuthServiceException>().having(
              (e) => e.type,
              'type',
              AuthServiceExceptionType.invalidCredentials,
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
        'should throw an AuthServiceException with type unknown '
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
            () => authService.login(
              username: username,
              password: password,
            ),
            throwsA(isA<AuthServiceException>().having(
              (e) => e.type,
              'type',
              AuthServiceExceptionType.unknown,
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

          final response = await authService.getStudentSchedule(
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
            () async => await authService.getStudentSchedule(schedule: '20222'),
            throwsA(isA<AuthServiceException>().having(
              (e) => e.type,
              'exception type',
              AuthServiceExceptionType.unknown,
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
            () async => await authService.getStudentSchedule(schedule: '20222'),
            throwsA(isA<AuthServiceException>().having(
              (e) => e.type,
              'exception type',
              AuthServiceExceptionType.sessionExpired,
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
            () async => await authService.getStudentSchedule(schedule: '20222'),
            throwsA(isA<AuthServiceException>().having(
              (e) => e.type,
              'exception type',
              AuthServiceExceptionType.unknown,
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

          authService.logout();

          verify(() => mockCookieJar.deleteAll()).called(1);
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
