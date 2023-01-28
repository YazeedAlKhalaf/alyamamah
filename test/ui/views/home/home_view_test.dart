import 'package:alyamamah/ui/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import '../../../test_utils/test_devices.dart';
import '../../../test_utils/test_material_app.dart';

void main() {
  group('HomeView |', () {
    Widget buildTestWidget() {
      return const TestMaterialApp(
        home: HomeView(),
      );
    }

    group('goldens |', () {
      testGoldens(
        'renders correctly.',
        (WidgetTester tester) async {
          await tester.pumpWidget(buildTestWidget());

          await multiScreenGolden(
            tester,
            'home_view.default',
            devices: testDevices,
          );
        },
      );
    });
  });
}
