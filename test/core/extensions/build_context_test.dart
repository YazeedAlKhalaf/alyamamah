import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_utils/test_material_app.dart';

void main() {
  group('BuildContextX |', () {
    Widget buildTestWidget() {
      return const TestMaterialApp(
        home: SizedBox(),
      );
    }

    testWidgets(
      'verify context.s works just like S.of(context).',
      (WidgetTester tester) async {
        await tester.pumpWidget(buildTestWidget());
        await tester.pumpAndSettle();

        final context = tester.element(find.byType(SizedBox));
        expect(context.s, S.of(context));
      },
    );
  });
}
