import 'dart:convert';

import 'package:alyamamah/core/models/actor_details.dart';
import 'package:alyamamah/core/services/auth/auth_service.dart';
import 'package:alyamamah/core/services/auth/auth_service_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../test_utils/matchers/auth_header_options_matcher.dart';
import 'fixtures/actor_details_response.dart';

void main() {
  group('AuthService |', () {
    late MockDio mockDio;
    late AuthService authService;

    setUp(() {
      mockDio = MockDio();

      authService = AuthService(
        dio: mockDio,
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
  });
}

class MockDio extends Mock implements Dio {}
