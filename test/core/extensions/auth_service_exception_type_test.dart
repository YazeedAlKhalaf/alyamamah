import 'package:alyamamah/core/extensions/auth_service_exception_type.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/services/auth/auth_service_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_utils/test_material_app.dart';

void main() {
  group('AuthServiceExceptionTypeX |', () {
    group('mapAuthServiceExceptionType |', () {
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

          final result = AuthServiceExceptionType.unknown
              .mapAuthServiceExceptionType(context);
          expect(result, context.s.unknown_service_error);
        },
      );

      testWidgets(
        'should get unknown_service_error if type is invalidCredentials.',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            const TestMaterialApp(
              home: Scaffold(body: Text('test')),
            ),
          );
          await tester.pumpAndSettle();

          final context = tester.element(find.text('test'));

          final result = AuthServiceExceptionType.invalidCredentials
              .mapAuthServiceExceptionType(context);
          expect(result, context.s.invalid_credentials);
        },
      );
    });
  });
}
