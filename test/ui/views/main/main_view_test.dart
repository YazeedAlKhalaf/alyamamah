import 'package:alyamamah/ui/views/main/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import '../../../test_utils/test_devices.dart';
import '../../../test_utils/test_material_app.dart';

void main() {
  group('MainView |', () {
    Widget buildTestWidget() {
      return const TestMaterialApp(
        home: MainView(),
      );
    }

    group('goldens |', () {
      testGoldens(
        'renders correctly.',
        (WidgetTester tester) async {
          await tester.pumpWidget(buildTestWidget());

          await multiScreenGolden(
            tester,
            'main_view.default',
            devices: testDevices,
          );
        },
      );
    });
  });
}
