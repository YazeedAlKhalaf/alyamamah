import 'package:alyamamah/core/app.dart';
import 'package:alyamamah/core/themes/themes.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App |', () {
    Widget buildTestWidget() {
      return const App();
    }

    testWidgets(
      'should find one ProviderScope.',
      (WidgetTester tester) async {
        await tester.pumpWidget(buildTestWidget());
        await tester.pumpAndSettle();

        final providerScopeFinder = find.byType(ProviderScope);
        expect(providerScopeFinder, findsOneWidget);
      },
    );

    testWidgets(
      'AppWithoutProviderScope should be the child of ProviderScope.',
      (WidgetTester tester) async {
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
    Widget buildTestWidget() {
      return const ProviderScope(
        child: AppWithoutProviderScope(),
      );
    }

    testWidgets(
      'should find one MaterialApp.',
      (WidgetTester tester) async {
        await tester.pumpWidget(buildTestWidget());
        await tester.pumpAndSettle();

        final materialAppFinder = find.byType(MaterialApp);
        expect(materialAppFinder, findsOneWidget);
      },
    );

    testWidgets(
      'verify routerDelegate '
      'is an AutoRouterDelegate instance.',
      (WidgetTester tester) async {
        await tester.pumpWidget(buildTestWidget());
        await tester.pumpAndSettle();

        final materialAppFinder = find.byType(MaterialApp);
        expect(materialAppFinder, findsOneWidget);

        final materialApp = tester.widget<MaterialApp>(
          materialAppFinder,
        );
        expect(
          materialApp.routerDelegate,
          isA<AutoRouterDelegate>(),
        );
      },
    );

    testWidgets(
      'verify routeInformationParser '
      'is a DefaultRouteParser instance.',
      (WidgetTester tester) async {
        await tester.pumpWidget(buildTestWidget());
        await tester.pumpAndSettle();

        final materialAppFinder = find.byType(MaterialApp);
        expect(materialAppFinder, findsOneWidget);

        final materialApp = tester.widget<MaterialApp>(
          materialAppFinder,
        );
        expect(
          materialApp.routeInformationParser,
          isA<DefaultRouteParser>(),
        );
      },
    );

    testWidgets(
      'verify routeInformationProvider '
      'is a AutoRouteInformationProvider instance.',
      (WidgetTester tester) async {
        await tester.pumpWidget(buildTestWidget());
        await tester.pumpAndSettle();

        final materialAppFinder = find.byType(MaterialApp);
        expect(materialAppFinder, findsOneWidget);

        final materialApp = tester.widget<MaterialApp>(
          materialAppFinder,
        );
        expect(
          materialApp.routeInformationProvider,
          isA<AutoRouteInformationProvider>(),
        );
      },
    );

    testWidgets(
      'verify localizationsDelegates '
      'is from the S class.',
      (WidgetTester tester) async {
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
      'verify theme '
      'is from the S class.',
      (WidgetTester tester) async {
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
      'verify builder if child is not null.',
      (WidgetTester tester) async {
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
