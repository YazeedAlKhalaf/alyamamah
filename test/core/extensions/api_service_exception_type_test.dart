import 'package:alyamamah/core/extensions/api_service_exception_type.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/services/api/api_service_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_utils/test_material_app.dart';

void main() {
  group('ApiServiceExceptionTypeX |', () {
    group('mapApiServiceExceptionType |', () {
      testWidgets(
        'should get unknown_service_error if type is unknown.',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            const TestMaterialApp(
              home: Scaffold(body: Text('test')),
            ),
          );
          await tester.pumpAndSettle();

          final context = tester.element(find.text('test'));

          final result = ApiServiceExceptionType.unknown
              .mapApiServiceExceptionType(context);
          expect(result, context.s.unknown_service_error);
        },
      );

      testWidgets(
        'should get invalid_credentials if type is invalidCredentials.',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            const TestMaterialApp(
              home: Scaffold(body: Text('test')),
            ),
          );
          await tester.pumpAndSettle();

          final context = tester.element(find.text('test'));

          final result = ApiServiceExceptionType.invalidCredentials
              .mapApiServiceExceptionType(context);
          expect(result, context.s.invalid_credentials);
        },
      );

      testWidgets(
        'should get session_expired if type is sessionExpired.',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            const TestMaterialApp(
              home: Scaffold(body: Text('test')),
            ),
          );
          await tester.pumpAndSettle();

          final context = tester.element(find.text('test'));

          final result = ApiServiceExceptionType.sessionExpired
              .mapApiServiceExceptionType(context);
          expect(result, context.s.session_expired);
        },
      );
    });
  });
}
