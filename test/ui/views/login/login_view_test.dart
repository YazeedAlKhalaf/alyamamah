import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/services/auth/auth_service_exception.dart';
import 'package:alyamamah/ui/views/login/login_view.dart';
import 'package:alyamamah/ui/views/login/login_view_model.dart';
import 'package:alyamamah/ui/widgets/button_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';

import '../../../test_utils/test_devices.dart';
import '../../../test_utils/test_material_app.dart';

void main() {
  group('LoginView |', () {
    late MockLoginViewModel mockLoginViewModel;

    setUp(() {
      mockLoginViewModel = MockLoginViewModel();
    });

    Widget buildTestWidget() {
      return TestMaterialApp(
        overrides: [
          loginViewModelProvider.overrideWith((ref) => mockLoginViewModel),
        ],
        home: const LoginView(),
      );
    }

    group('show password button |', () {
      testWidgets(
        'should find the visibility_off_rounded if showPassword is false.',
        (WidgetTester tester) async {
          when(() => mockLoginViewModel.username).thenReturn('');
          when(() => mockLoginViewModel.password).thenReturn('');
          when(() => mockLoginViewModel.showPassword).thenReturn(false);
          when(() => mockLoginViewModel.isBusy).thenReturn(false);
          when(() => mockLoginViewModel.authServiceExceptionType)
              .thenReturn(null);

          await tester.pumpWidget(buildTestWidget());
          await tester.pumpAndSettle();

          final showPasswordButtonFinder = find.byKey(
            LoginView.showPasswordButtonKey,
          );
          expect(showPasswordButtonFinder, findsOneWidget);
          expect(tester.widget(showPasswordButtonFinder), isA<IconButton>());

          final showPasswordButton = tester.widget<IconButton>(
            showPasswordButtonFinder,
          );
          expect(showPasswordButton.icon, isA<Icon>());

          final showPasswordButtonIcon = showPasswordButton.icon as Icon;
          expect(showPasswordButtonIcon.icon, Icons.visibility_off_rounded);
        },
      );

      testWidgets(
        'should find the visibility_rounded if showPassword is true.',
        (WidgetTester tester) async {
          when(() => mockLoginViewModel.username).thenReturn('');
          when(() => mockLoginViewModel.password).thenReturn('');
          when(() => mockLoginViewModel.showPassword).thenReturn(true);
          when(() => mockLoginViewModel.isBusy).thenReturn(false);
          when(() => mockLoginViewModel.authServiceExceptionType)
              .thenReturn(null);

          await tester.pumpWidget(buildTestWidget());
          await tester.pumpAndSettle();

          final showPasswordButtonFinder = find.byKey(
            LoginView.showPasswordButtonKey,
          );
          expect(showPasswordButtonFinder, findsOneWidget);
          expect(tester.widget(showPasswordButtonFinder), isA<IconButton>());

          final showPasswordButton = tester.widget<IconButton>(
            showPasswordButtonFinder,
          );
          expect(showPasswordButton.icon, isA<Icon>());

          final showPasswordButtonIcon = showPasswordButton.icon as Icon;
          expect(showPasswordButtonIcon.icon, Icons.visibility_rounded);
        },
      );

      testWidgets(
        'should verify onPressed calls toggleShowPassword().',
        (WidgetTester tester) async {
          when(() => mockLoginViewModel.username).thenReturn('');
          when(() => mockLoginViewModel.password).thenReturn('');
          when(() => mockLoginViewModel.showPassword).thenReturn(false);
          when(() => mockLoginViewModel.isBusy).thenReturn(false);
          when(() => mockLoginViewModel.authServiceExceptionType)
              .thenReturn(null);

          when(() => mockLoginViewModel.toggleShowPassword()).thenReturn(null);

          await tester.pumpWidget(buildTestWidget());
          await tester.pumpAndSettle();

          final showPasswordButtonFinder = find.byKey(
            LoginView.showPasswordButtonKey,
          );
          expect(showPasswordButtonFinder, findsOneWidget);
          expect(tester.widget(showPasswordButtonFinder), isA<IconButton>());

          final showPasswordButton = tester.widget<IconButton>(
            showPasswordButtonFinder,
          );

          showPasswordButton.onPressed?.call();
          verify(() => mockLoginViewModel.toggleShowPassword()).called(1);
        },
      );
    });

    group('login button |', () {
      testWidgets(
        'should find the login text if isBusy is false.',
        (WidgetTester tester) async {
          when(() => mockLoginViewModel.username).thenReturn('');
          when(() => mockLoginViewModel.password).thenReturn('');
          when(() => mockLoginViewModel.showPassword).thenReturn(false);
          when(() => mockLoginViewModel.isBusy).thenReturn(false);
          when(() => mockLoginViewModel.authServiceExceptionType)
              .thenReturn(null);

          await tester.pumpWidget(buildTestWidget());
          await tester.pumpAndSettle();

          final loginButtonFinder = find.byKey(
            LoginView.loginButtonKey,
          );
          expect(loginButtonFinder, findsOneWidget);

          final context = tester.element(loginButtonFinder);

          expect(tester.widget(loginButtonFinder), isA<FilledButton>());
          final loginButton = tester.widget<FilledButton>(
            loginButtonFinder,
          );
          expect(loginButton.child, isA<Text>());

          final loginButtonChild = loginButton.child as Text;
          expect(loginButtonChild.data, context.s.login);
        },
      );

      testWidgets(
        'should find the ButtonLoading widget if isBusy is true.',
        (WidgetTester tester) async {
          when(() => mockLoginViewModel.username).thenReturn('');
          when(() => mockLoginViewModel.password).thenReturn('');
          when(() => mockLoginViewModel.showPassword).thenReturn(false);
          when(() => mockLoginViewModel.isBusy).thenReturn(true);
          when(() => mockLoginViewModel.authServiceExceptionType)
              .thenReturn(null);

          await tester.pumpWidget(buildTestWidget());
          await tester.pump();

          final loginButtonFinder = find.byKey(
            LoginView.loginButtonKey,
          );
          expect(loginButtonFinder, findsOneWidget);

          expect(tester.widget(loginButtonFinder), isA<FilledButton>());
          final loginButton = tester.widget<FilledButton>(
            loginButtonFinder,
          );
          expect(loginButton.child, isA<ButtonLoading>());
        },
      );

      testWidgets(
        'should verify onPressed calls login().',
        (WidgetTester tester) async {
          when(() => mockLoginViewModel.username).thenReturn('');
          when(() => mockLoginViewModel.password).thenReturn('');
          when(() => mockLoginViewModel.showPassword).thenReturn(false);
          when(() => mockLoginViewModel.isBusy).thenReturn(true);
          when(() => mockLoginViewModel.authServiceExceptionType)
              .thenReturn(null);

          when(() => mockLoginViewModel.login()).thenAnswer(
            (_) => Future<void>.value(),
          );

          await tester.pumpWidget(buildTestWidget());
          await tester.pump();

          final loginButtonFinder = find.byKey(
            LoginView.loginButtonKey,
          );
          expect(loginButtonFinder, findsOneWidget);

          expect(tester.widget(loginButtonFinder), isA<FilledButton>());
          final loginButton = tester.widget<FilledButton>(
            loginButtonFinder,
          );

          loginButton.onPressed?.call();
          verify(() => mockLoginViewModel.login()).called(1);
        },
      );
    });

    group('goldens |', () {
      testGoldens(
        'renders correctly '
        'when username is empty, password is empty, showPassword is false '
        'isBusy is false, and authServiceExceptionType is null.',
        (WidgetTester tester) async {
          when(() => mockLoginViewModel.username).thenReturn('');
          when(() => mockLoginViewModel.password).thenReturn('');
          when(() => mockLoginViewModel.showPassword).thenReturn(false);
          when(() => mockLoginViewModel.isBusy).thenReturn(false);
          when(() => mockLoginViewModel.authServiceExceptionType)
              .thenReturn(null);

          await tester.pumpWidget(buildTestWidget());

          await multiScreenGolden(
            tester,
            'login_screen_default',
            devices: testDevices,
          );
        },
      );

      testGoldens(
        'renders correctly '
        'when username is not empty, password is not empty, '
        'showPassword is false, isBusy is false, '
        'and authServiceExceptionType is null.',
        (WidgetTester tester) async {
          when(() => mockLoginViewModel.username).thenReturn('202211111');
          when(() => mockLoginViewModel.password).thenReturn('202211111');
          when(() => mockLoginViewModel.showPassword).thenReturn(false);
          when(() => mockLoginViewModel.isBusy).thenReturn(false);
          when(() => mockLoginViewModel.authServiceExceptionType)
              .thenReturn(null);

          await tester.pumpWidget(buildTestWidget());

          await multiScreenGolden(
            tester,
            'login_screen_username_password',
            devices: testDevices,
          );
        },
      );

      testGoldens(
        'renders correctly '
        'when username is not empty, password is not empty, '
        'showPassword is true, isBusy is false, '
        'and authServiceExceptionType is null.',
        (WidgetTester tester) async {
          when(() => mockLoginViewModel.username).thenReturn('202211111');
          when(() => mockLoginViewModel.password).thenReturn('202211111');
          when(() => mockLoginViewModel.showPassword).thenReturn(true);
          when(() => mockLoginViewModel.isBusy).thenReturn(false);
          when(() => mockLoginViewModel.authServiceExceptionType)
              .thenReturn(null);

          await tester.pumpWidget(buildTestWidget());

          await multiScreenGolden(
            tester,
            'login_screen_username_password_show_password',
            devices: testDevices,
          );
        },
      );

      testGoldens(
        'renders correctly '
        'when username is not empty, password is not empty, '
        'showPassword is false, isBusy is true, '
        'and authServiceExceptionType is null.',
        (WidgetTester tester) async {
          when(() => mockLoginViewModel.username).thenReturn('202211111');
          when(() => mockLoginViewModel.password).thenReturn('202211111');
          when(() => mockLoginViewModel.showPassword).thenReturn(false);
          when(() => mockLoginViewModel.isBusy).thenReturn(true);
          when(() => mockLoginViewModel.authServiceExceptionType)
              .thenReturn(null);

          await tester.pumpWidget(buildTestWidget());

          await multiScreenGolden(
            tester,
            'login_screen_username_password_is_busy',
            devices: testDevices,
            customPump: (WidgetTester tester) async {
              await tester.pump(const Duration(milliseconds: 100));
            },
          );
        },
      );

      testGoldens(
        'renders correctly '
        'when username is not empty, password is not empty, '
        'showPassword is false, isBusy is false, '
        'and authServiceExceptionType is unknown.',
        (WidgetTester tester) async {
          when(() => mockLoginViewModel.username).thenReturn('202211111');
          when(() => mockLoginViewModel.password).thenReturn('202211111');
          when(() => mockLoginViewModel.showPassword).thenReturn(false);
          when(() => mockLoginViewModel.isBusy).thenReturn(false);
          when(() => mockLoginViewModel.authServiceExceptionType)
              .thenReturn(AuthServiceExceptionType.unknown);

          await tester.pumpWidget(buildTestWidget());

          await multiScreenGolden(
            tester,
            'login_screen_username_password_auth_service_exception_type_is_unknown',
            devices: testDevices,
          );
        },
      );

      testGoldens(
        'renders correctly '
        'when username is not empty, password is not empty, '
        'showPassword is false, isBusy is false, '
        'and authServiceExceptionType is invalidCredentials.',
        (WidgetTester tester) async {
          when(() => mockLoginViewModel.username).thenReturn('202211111');
          when(() => mockLoginViewModel.password).thenReturn('202211111');
          when(() => mockLoginViewModel.showPassword).thenReturn(false);
          when(() => mockLoginViewModel.isBusy).thenReturn(false);
          when(() => mockLoginViewModel.authServiceExceptionType)
              .thenReturn(AuthServiceExceptionType.invalidCredentials);

          await tester.pumpWidget(buildTestWidget());

          await multiScreenGolden(
            tester,
            'login_screen_username_password_auth_service_exception_type_is_invalidCredentials',
            devices: testDevices,
          );
        },
      );
    });
  });
}

class MockLoginViewModel extends Mock implements LoginViewModel {}
