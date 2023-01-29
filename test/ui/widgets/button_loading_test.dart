import 'package:alyamamah/ui/widgets/button_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import '../../test_utils/test_material_app.dart';

void main() {
  group('ButtonLoading |', () {
    Widget buildTestWidget() {
      return const TestMaterialApp(
        home: Scaffold(
          body: Center(
            child: ButtonLoading(),
          ),
        ),
      );
    }

    testGoldens(
      'goldens |',
      (WidgetTester tester) async {
        await tester.pumpWidget(buildTestWidget());

        await screenMatchesGolden(
          tester,
          'button_loading',
          autoHeight: true,
          customPump: (WidgetTester tester) async {
            await tester.pump(const Duration(milliseconds: 300));
          },
        );
      },
    );
  });
}
