import 'package:alyamamah/ui/views/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import '../../../test_utils/test_devices.dart';
import '../../../test_utils/test_material_app.dart';

void main() {
  group('LoginView |', () {
    Widget buildTestWidget() {
      return const TestMaterialApp(
        home: LoginView(),
      );
    }

    group('goldens |', () {
      testGoldens(
        'renders correctly.',
        (WidgetTester tester) async {
          await tester.pumpWidget(buildTestWidget());

          await multiScreenGolden(
            tester,
            'login_screen_default',
            devices: testDevices,
          );
        },
      );
    });
  });
}
