import 'package:alyamamah/ui/views/main/main_view.dart';
import 'package:alyamamah/ui/views/main/main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
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
        when(() => mockMainViewModel.isExtended).thenReturn(true);

        await tester.pumpWidget(buildTestWidget());
        await tester.pumpAndSettle();

        final parentWidgetFinder = find.byKey(MainView.parentWidget);
        expect(parentWidgetFinder, findsOneWidget);

        final parentWidget = tester.widget(parentWidgetFinder);
        expect(parentWidget, isA<Scaffold>());
      },
    );

    testWidgets(
      'should find Row as body of scaffold.',
      (WidgetTester tester) async {
        when(() => mockMainViewModel.selectedIndex).thenReturn(0);
        when(() => mockMainViewModel.isExtended).thenReturn(true);

        await tester.pumpWidget(buildTestWidget());
        await tester.pumpAndSettle();

        final parentWidgetFinder = find.byKey(MainView.parentWidget);
        expect(parentWidgetFinder, findsOneWidget);

        final parentWidget = tester.widget(parentWidgetFinder);
        expect(parentWidget, isA<Scaffold>());

        final scaffold = parentWidget as Scaffold;

        expect(scaffold.body, isA<Row>());
      },
    );

    testWidgets(
      'should find navigation bar as bottom navigation bar of scaffold '
      'and find no navigation rail '
      'if device is not tablet.',
      (WidgetTester tester) async {
        when(() => mockMainViewModel.selectedIndex).thenReturn(0);
        when(() => mockMainViewModel.isExtended).thenReturn(true);

        tester.binding.window.physicalSizeTestValue = Device.iphone11.size;

        await tester.pumpWidget(buildTestWidget());
        await tester.pumpAndSettle();

        final parentWidgetFinder = find.byKey(MainView.parentWidget);
        expect(parentWidgetFinder, findsOneWidget);

        final parentWidget = tester.widget(parentWidgetFinder);
        expect(parentWidget, isA<Scaffold>());

        final scaffold = parentWidget as Scaffold;

        expect(scaffold.bottomNavigationBar, isA<NavigationBar>());

        expect(find.byType(NavigationRail), findsNothing);

        addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
      },
    );
  });
}

class MockMainViewModel extends Mock implements MainViewModel {}
