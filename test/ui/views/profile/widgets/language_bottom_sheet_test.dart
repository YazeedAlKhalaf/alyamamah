import 'package:alyamamah/core/extensions/locale.dart';
import 'package:alyamamah/core/services/locale/locale_service.dart';
import 'package:alyamamah/ui/views/profile/widgets/language_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_utils/test_material_app.dart';

void main() {
  group('LanguageBottomSheet |', () {
    late MockLocaleService mockLocaleService;
    late MockNavigatorObserver mockNavigatorObserver;

    setUpAll(() {
      registerFallbackValue(FakeRoute());
    });

    setUp(() {
      mockLocaleService = MockLocaleService();
      mockNavigatorObserver = MockNavigatorObserver();
    });

    Widget buildTestWidget() {
      return TestMaterialApp(
        overrides: [
          localeServiceProvider.overrideWith((ref) => mockLocaleService),
        ],
        home: const LanguageBottomSheet(),
        navigatorObservers: [mockNavigatorObserver],
      );
    }

    testWidgets(
      'should verify the onTap of the list tile.',
      (WidgetTester tester) async {
        when(() => mockLocaleService.setLocale(const Locale('ar')))
            .thenAnswer((_) => Future.value());
        when(
          () => mockLocaleService.locale,
        ).thenReturn(const Locale('en'));

        await tester.pumpWidget(buildTestWidget());
        await tester.pumpAndSettle();

        final context = tester.element(find.byType(LanguageBottomSheet));

        await tester.tap(find.text(const Locale('ar').mapToString(context)));
        await tester.pumpAndSettle();

        verify(
          () => mockLocaleService.setLocale(const Locale('ar')),
        ).called(1);

        verify(
          () => mockNavigatorObserver.didPop(any(), any()),
        ).called(1);
      },
    );

    group('goldens |', () {
      testGoldens(
        'verify bottom sheet if the locale is arabic.',
        (WidgetTester tester) async {
          when(
            () => mockLocaleService.locale,
          ).thenReturn(const Locale('ar'));

          await tester.pumpWidget(buildTestWidget());
          await tester.pumpAndSettle();

          await screenMatchesGolden(
            tester,
            'language_bottom_sheet_arabic_locale',
          );
        },
      );

      testGoldens(
        'verify bottom sheet if the locale is english.',
        (WidgetTester tester) async {
          when(
            () => mockLocaleService.locale,
          ).thenReturn(const Locale('en'));

          await tester.pumpWidget(buildTestWidget());
          await tester.pumpAndSettle();

          await screenMatchesGolden(
            tester,
            'language_bottom_sheet_english_locale',
          );
        },
      );

      testGoldens(
        'verify bottom sheet if the locale is null.',
        (WidgetTester tester) async {
          when(
            () => mockLocaleService.locale,
          ).thenReturn(null);

          await tester.pumpWidget(buildTestWidget());
          await tester.pumpAndSettle();

          await screenMatchesGolden(
            tester,
            'language_bottom_sheet_null_locale',
          );
        },
      );
    });
  });
}

class MockLocaleService extends Mock implements LocaleService {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class FakeRoute extends Fake implements Route<dynamic> {}
