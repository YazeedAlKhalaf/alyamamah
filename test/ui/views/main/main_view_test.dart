import 'package:alyamamah/ui/views/main/main_view.dart';
import 'package:alyamamah/ui/views/main/main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../test_utils/test_material_app.dart';

void main() {
  group('MainView |', () {
    late MockMainViewModel mockMainViewModel;

    setUp(() {
      mockMainViewModel = MockMainViewModel();
    });

    Widget buildTestWidget() {
      return TestMaterialApp(
        overrides: [
          mainViewModelProvider.overrideWith((ref) => mockMainViewModel),
        ],
        home: const MainView(
          pages: [Text('home'), Text('profile')],
        ),
      );
    }

    testWidgets(
      'should find scaffold as parent widget.',
      (WidgetTester tester) async {
        when(() => mockMainViewModel.selectedIndex).thenReturn(0);

        await tester.pumpWidget(buildTestWidget());
        await tester.pumpAndSettle();

        final parentWidgetFinder = find.byKey(MainView.parentWidget);
        expect(parentWidgetFinder, findsOneWidget);

        final parentWidget = tester.widget(parentWidgetFinder);
        expect(parentWidget, isA<Scaffold>());
      },
    );

    testWidgets(
      'should find indexed stack as body of scaffold.',
      (WidgetTester tester) async {
        when(() => mockMainViewModel.selectedIndex).thenReturn(0);

        await tester.pumpWidget(buildTestWidget());
        await tester.pumpAndSettle();

        final parentWidgetFinder = find.byKey(MainView.parentWidget);
        expect(parentWidgetFinder, findsOneWidget);

        final parentWidget = tester.widget(parentWidgetFinder);
        expect(parentWidget, isA<Scaffold>());

        final scaffold = parentWidget as Scaffold;

        expect(scaffold.body, isA<IndexedStack>());
      },
    );

    testWidgets(
      'should find navigation bar as bottom navigation bar of scaffold.',
      (WidgetTester tester) async {
        when(() => mockMainViewModel.selectedIndex).thenReturn(0);

        await tester.pumpWidget(buildTestWidget());
        await tester.pumpAndSettle();

        final parentWidgetFinder = find.byKey(MainView.parentWidget);
        expect(parentWidgetFinder, findsOneWidget);

        final parentWidget = tester.widget(parentWidgetFinder);
        expect(parentWidget, isA<Scaffold>());

        final scaffold = parentWidget as Scaffold;

        expect(scaffold.bottomNavigationBar, isA<NavigationBar>());
      },
    );
  });
}

class MockMainViewModel extends Mock implements MainViewModel {}
