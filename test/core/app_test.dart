import 'package:alyamamah/core/app.dart';
import 'package:alyamamah/core/providers/firebase_analytics/firebase_analytics_provider.dart';
import 'package:alyamamah/core/services/locale/locale_service.dart';
import 'package:alyamamah/core/services/shared_prefs/shared_prefs_service.dart';
import 'package:alyamamah/core/services/theme/theme_service.dart';
import 'package:alyamamah/core/themes/themes.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('App |', () {
    late MockSharedPreferences mockSharedPreferences;
    late MockFirebaseAnalytics mockFirebaseAnalytics;

    setUp(() {
      mockSharedPreferences = MockSharedPreferences();
      mockFirebaseAnalytics = MockFirebaseAnalytics();
    });

    Widget buildTestWidget() {
      return App(
        sharedPreferences: mockSharedPreferences,
        overrides: [
          firebaseAnalyticsProvider.overrideWith(
            (ref) => mockFirebaseAnalytics,
          ),
        ],
      );
    }

    testWidgets(
      'should find one ProviderScope.',
      (WidgetTester tester) async {
        when(
          () => mockFirebaseAnalytics.setCurrentScreen(
            screenName: any(named: 'screenName'),
          ),
        ).thenAnswer((invocation) => Future.value());

        await tester.pumpWidget(buildTestWidget());
        await tester.pumpAndSettle();

        final providerScopeFinder = find.byType(ProviderScope);
        expect(providerScopeFinder, findsOneWidget);
      },
    );

    testWidgets(
      'AppWithoutProviderScope should be the child of ProviderScope.',
      (WidgetTester tester) async {
        when(
          () => mockFirebaseAnalytics.setCurrentScreen(
            screenName: any(named: 'screenName'),
          ),
        ).thenAnswer((invocation) => Future.value());

        await tester.pumpWidget(buildTestWidget());
        await tester.pumpAndSettle();

        final providerScopeFinder = find.byType(ProviderScope);
        expect(providerScopeFinder, findsOneWidget);

        final providerScope = tester.widget<ProviderScope>(
          providerScopeFinder,
        );
        expect(providerScope.child, isA<AppWithoutProviderScope>());
      },
    );
  });

  group('AppWithoutProviderScope |', () {
    late MockSharedPreferences mockSharedPreferences;
    late MockThemeService mockThemeService;
    late MockLocaleService mockLocaleService;
    late MockFirebaseAnalytics mockFirebaseAnalytics;

    setUp(() {
      mockSharedPreferences = MockSharedPreferences();
      mockThemeService = MockThemeService();
      mockLocaleService = MockLocaleService();
      mockFirebaseAnalytics = MockFirebaseAnalytics();

      when(() => mockLocaleService.locale).thenReturn(const Locale('en'));
      when(() => mockThemeService.themeMode).thenReturn(ThemeMode.system);
    });

    Widget buildTestWidget() {
      return ProviderScope(
        overrides: [
          sharedPreferencesProvider
              .overrideWith((ref) => mockSharedPreferences),
          themeServiceProvider.overrideWith((ref) => mockThemeService),
          localeServiceProvider.overrideWith((ref) => mockLocaleService),
          firebaseAnalyticsProvider.overrideWith(
            (ref) => mockFirebaseAnalytics,
          ),
        ],
        child: const AppWithoutProviderScope(),
      );
    }

    testWidgets(
      'should find one MaterialApp.',
      (WidgetTester tester) async {
        when(
          () => mockFirebaseAnalytics.setCurrentScreen(
            screenName: any(named: 'screenName'),
          ),
        ).thenAnswer((invocation) => Future.value());

        await tester.pumpWidget(buildTestWidget());
        await tester.pumpAndSettle();

        final materialAppFinder = find.byType(MaterialApp);
        expect(materialAppFinder, findsOneWidget);
      },
    );

    testWidgets(
      'verify routerConfig '
      'is an AutoRouterDelegate instance.',
      (WidgetTester tester) async {
        when(
          () => mockFirebaseAnalytics.setCurrentScreen(
            screenName: any(named: 'screenName'),
          ),
        ).thenAnswer((invocation) => Future.value());

        await tester.pumpWidget(buildTestWidget());
        await tester.pumpAndSettle();

        final materialAppFinder = find.byType(MaterialApp);
        expect(materialAppFinder, findsOneWidget);

        final materialApp = tester.widget<MaterialApp>(
          materialAppFinder,
        );
        expect(
          materialApp.routerConfig,
          isA<RouterConfig<UrlState>>(),
        );
      },
    );

    testWidgets(
      'verify localizationsDelegates '
      'is from the S class.',
      (WidgetTester tester) async {
        when(
          () => mockFirebaseAnalytics.setCurrentScreen(
            screenName: any(named: 'screenName'),
          ),
        ).thenAnswer((invocation) => Future.value());

        await tester.pumpWidget(buildTestWidget());
        await tester.pumpAndSettle();

        final materialAppFinder = find.byType(MaterialApp);
        expect(materialAppFinder, findsOneWidget);

        final materialApp = tester.widget<MaterialApp>(
          materialAppFinder,
        );
        expect(
          materialApp.localizationsDelegates,
          S.localizationsDelegates,
        );
      },
    );

    testWidgets(
      'verify supportedLocales '
      'is from the S class.',
      (WidgetTester tester) async {
        when(
          () => mockFirebaseAnalytics.setCurrentScreen(
            screenName: any(named: 'screenName'),
          ),
        ).thenAnswer((invocation) => Future.value());

        await tester.pumpWidget(buildTestWidget());
        await tester.pumpAndSettle();

        final materialAppFinder = find.byType(MaterialApp);
        expect(materialAppFinder, findsOneWidget);

        final materialApp = tester.widget<MaterialApp>(
          materialAppFinder,
        );
        expect(
          materialApp.supportedLocales,
          S.supportedLocales,
        );
      },
    );

    testWidgets(
      'verify locale '
      'is from the locale service.',
      (WidgetTester tester) async {
        when(
          () => mockFirebaseAnalytics.setCurrentScreen(
            screenName: any(named: 'screenName'),
          ),
        ).thenAnswer((invocation) => Future.value());

        when(() => mockLocaleService.locale).thenReturn(const Locale('ar'));

        await tester.pumpWidget(buildTestWidget());
        await tester.pumpAndSettle();

        final materialAppFinder = find.byType(MaterialApp);
        expect(materialAppFinder, findsOneWidget);

        final materialApp = tester.widget<MaterialApp>(
          materialAppFinder,
        );
        expect(
          materialApp.locale,
          const Locale('ar'),
        );
      },
    );

    testWidgets(
      'verify themeMode '
      'is from the locale service.',
      (WidgetTester tester) async {
        when(
          () => mockFirebaseAnalytics.setCurrentScreen(
            screenName: any(named: 'screenName'),
          ),
        ).thenAnswer((invocation) => Future.value());

        when(() => mockThemeService.themeMode).thenReturn(ThemeMode.light);

        await tester.pumpWidget(buildTestWidget());
        await tester.pumpAndSettle();

        final materialAppFinder = find.byType(MaterialApp);
        expect(materialAppFinder, findsOneWidget);

        final materialApp = tester.widget<MaterialApp>(
          materialAppFinder,
        );
        expect(
          materialApp.themeMode,
          ThemeMode.light,
        );
      },
    );

    testWidgets(
      'verify theme '
      'is from the Themes class.',
      (WidgetTester tester) async {
        when(
          () => mockFirebaseAnalytics.setCurrentScreen(
            screenName: any(named: 'screenName'),
          ),
        ).thenAnswer((invocation) => Future.value());

        await tester.pumpWidget(buildTestWidget());
        await tester.pumpAndSettle();

        final materialAppFinder = find.byType(MaterialApp);
        expect(materialAppFinder, findsOneWidget);

        final materialApp = tester.widget<MaterialApp>(
          materialAppFinder,
        );
        expect(materialApp.theme, Themes.light);
      },
    );

    testWidgets(
      'verify darkTheme '
      'is from the Themes class.',
      (WidgetTester tester) async {
        when(
          () => mockFirebaseAnalytics.setCurrentScreen(
            screenName: any(named: 'screenName'),
          ),
        ).thenAnswer((invocation) => Future.value());

        await tester.pumpWidget(buildTestWidget());
        await tester.pumpAndSettle();

        final materialAppFinder = find.byType(MaterialApp);
        expect(materialAppFinder, findsOneWidget);

        final materialApp = tester.widget<MaterialApp>(
          materialAppFinder,
        );
        expect(materialApp.darkTheme, Themes.dark);
      },
    );

    testWidgets(
      'verify builder if child is not null.',
      (WidgetTester tester) async {
        when(
          () => mockFirebaseAnalytics.setCurrentScreen(
            screenName: any(named: 'screenName'),
          ),
        ).thenAnswer((invocation) => Future.value());

        await tester.pumpWidget(buildTestWidget());
        await tester.pumpAndSettle();

        final materialAppFinder = find.byType(MaterialApp);
        expect(materialAppFinder, findsOneWidget);

        final context = tester.element(materialAppFinder);

        final materialApp = tester.widget<MaterialApp>(
          materialAppFinder,
        );

        final builderResult = materialApp.builder?.call(
          context,
          const Text('ahmad'),
        );
        expect(builderResult, isA<GestureDetector>());

        final gestureDetector = builderResult as GestureDetector;
        expect(gestureDetector.onTap, isNotNull);
        expect(gestureDetector.child, isA<Text>());
      },
    );

    testWidgets(
      'verify builder if child is null.',
      (WidgetTester tester) async {
        when(
          () => mockFirebaseAnalytics.setCurrentScreen(
            screenName: any(named: 'screenName'),
          ),
        ).thenAnswer((invocation) => Future.value());

        await tester.pumpWidget(buildTestWidget());
        await tester.pumpAndSettle();

        final materialAppFinder = find.byType(MaterialApp);
        expect(materialAppFinder, findsOneWidget);

        final context = tester.element(materialAppFinder);

        final materialApp = tester.widget<MaterialApp>(
          materialAppFinder,
        );

        final builderResult = materialApp.builder?.call(
          context,
          null,
        );
        expect(builderResult, isA<GestureDetector>());

        final gestureDetector = builderResult as GestureDetector;
        expect(gestureDetector.onTap, isNotNull);
        expect(gestureDetector.child, isNull);
      },
    );
  });
}

class MockSharedPreferences extends Mock implements SharedPreferences {}

class MockThemeService extends Mock implements ThemeService {}

class MockLocaleService extends Mock implements LocaleService {}

class MockFirebaseAnalytics extends Mock implements FirebaseAnalytics {}
