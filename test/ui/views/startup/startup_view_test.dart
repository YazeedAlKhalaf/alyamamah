import 'package:alyamamah/ui/views/startup/startup_view.dart';
import 'package:alyamamah/ui/views/startup/startup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';

import '../../../test_utils/test_devices.dart';
import '../../../test_utils/test_material_app.dart';

void main() {
  group('StartupView |', () {
    late MockStartupViewModel mockStartupViewModel;

    setUp(() {
      mockStartupViewModel = MockStartupViewModel();
    });

    Widget buildTestWidget() {
      return TestMaterialApp(
        overrides: [
          startupViewModelProvider.overrideWith((ref) => mockStartupViewModel),
        ],
        home: const StartupView(),
      );
    }

    testWidgets(
      'verify that handleStartup is called upon widget initialization.',
      (WidgetTester tester) async {
        when(() => mockStartupViewModel.handleStartup()).thenAnswer(
          (_) => Future<void>.value(),
        );

        await tester.pumpWidget(buildTestWidget());
        await tester.pump();

        verify(() => mockStartupViewModel.handleStartup()).called(1);
      },
    );

    group('goldens |', () {
      testGoldens(
        'renders correctly.',
        (WidgetTester tester) async {
          when(() => mockStartupViewModel.handleStartup()).thenAnswer(
            (_) => Future<void>.value(),
          );

          await tester.pumpWidget(buildTestWidget());

          await multiScreenGolden(
            tester,
            'startup_view',
            devices: testDevices,
            customPump: (tester) => tester.pump(
              const Duration(milliseconds: 100),
            ),
          );
        },
      );
    });
  });
}

class MockStartupViewModel extends Mock implements StartupViewModel {}
