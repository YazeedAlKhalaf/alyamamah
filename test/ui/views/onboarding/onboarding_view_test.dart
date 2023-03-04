import 'package:alyamamah/ui/views/onboarding/onboarding_view.dart';
import 'package:alyamamah/ui/views/onboarding/onboarding_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';

import '../../../test_utils/test_devices.dart';
import '../../../test_utils/test_material_app.dart';

void main() {
  group('OnboardingView |', () {
    late MockOnboardingViewModel mockOnboardingViewModel;

    setUp(() {
      mockOnboardingViewModel = MockOnboardingViewModel();
    });

    Widget buildTestWidget() {
      return TestMaterialApp(
        overrides: [
          onboardingViewModelProvider
              .overrideWith((_) => mockOnboardingViewModel),
        ],
        home: const OnboardingView(),
      );
    }

    testWidgets(
      'verify the onPressed of login button.',
      (WidgetTester tester) async {
        when(() => mockOnboardingViewModel.navigateToLoginView())
            .thenAnswer((_) => Future.value());

        await tester.pumpWidget(buildTestWidget());

        final loginButtonFinder = find.byKey(OnboardingView.loginButtonKey);
        expect(loginButtonFinder, findsOneWidget);

        await tester.tap(loginButtonFinder);
        await tester.pumpAndSettle();

        verify(() => mockOnboardingViewModel.navigateToLoginView()).called(1);
      },
    );

    group('goldens |', () {
      testGoldens(
        'verify the screen.',
        (WidgetTester tester) async {
          await tester.pumpWidget(buildTestWidget());

          await multiScreenGolden(
            tester,
            'onboarding_view',
            devices: testDevices,
          );
        },
      );
    });
  });
}

class MockOnboardingViewModel extends Mock implements OnboardingViewModel {}
