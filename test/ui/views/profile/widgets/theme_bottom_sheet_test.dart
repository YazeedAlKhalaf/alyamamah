import 'package:alyamamah/core/extensions/theme_mode.dart';
import 'package:alyamamah/core/services/theme/theme_service.dart';
import 'package:alyamamah/ui/views/profile/widgets/theme_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_utils/test_material_app.dart';

void main() {
  group('ThemeBottomSheet |', () {
    late MockThemeService mockThemeService;
    late MockNavigatorObserver mockNavigatorObserver;

    setUpAll(() {
      registerFallbackValue(FakeRoute());
    });

    setUp(() {
      mockThemeService = MockThemeService();
      mockNavigatorObserver = MockNavigatorObserver();
    });

    Widget buildTestWidget() {
      return TestMaterialApp(
        overrides: [
          themeServiceProvider.overrideWith((ref) => mockThemeService),
        ],
        home: const ThemeBottomSheet(),
        navigatorObservers: [mockNavigatorObserver],
      );
    }

    testWidgets(
      'should verify the onTap of the list tile.',
      (WidgetTester tester) async {
        when(
          () => mockThemeService.themeMode,
        ).thenReturn(ThemeMode.light);

        await tester.pumpWidget(buildTestWidget());
        await tester.pumpAndSettle();

        final context = tester.element(find.byType(ThemeBottomSheet));

        await tester.tap(find.text(ThemeMode.dark.mapToString(context)));
        await tester.pumpAndSettle();

        verify(
          () => mockThemeService.setThemeMode(ThemeMode.dark),
        ).called(1);

        verify(
          () => mockNavigatorObserver.didPop(any(), any()),
        ).called(1);
      },
    );

    group('goldens |', () {
      testGoldens(
        'verify bottom sheet if the theme is light.',
        (WidgetTester tester) async {
          when(
            () => mockThemeService.themeMode,
          ).thenReturn(ThemeMode.light);

          await tester.pumpWidget(buildTestWidget());
          await tester.pumpAndSettle();

          await screenMatchesGolden(
            tester,
            'theme_bottom_sheet_light_theme',
          );
        },
      );

      testGoldens(
        'verify bottom sheet if the theme is dark.',
        (WidgetTester tester) async {
          when(
            () => mockThemeService.themeMode,
          ).thenReturn(ThemeMode.dark);

          await tester.pumpWidget(buildTestWidget());
          await tester.pumpAndSettle();

          await screenMatchesGolden(
            tester,
            'theme_bottom_sheet_dark_theme',
          );
        },
      );

      testGoldens(
        'verify bottom sheet if the theme is system.',
        (WidgetTester tester) async {
          when(
            () => mockThemeService.themeMode,
          ).thenReturn(ThemeMode.system);

          await tester.pumpWidget(buildTestWidget());
          await tester.pumpAndSettle();

          await screenMatchesGolden(
            tester,
            'theme_bottom_sheet_system_theme',
          );
        },
      );
    });
  });
}

class MockThemeService extends Mock implements ThemeService {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class FakeRoute extends Fake implements Route<dynamic> {}
