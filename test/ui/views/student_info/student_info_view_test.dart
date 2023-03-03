import 'package:alyamamah/core/models/actor_details.dart';
import 'package:alyamamah/core/providers/actor_details/actor_details_notifier.dart';
import 'package:alyamamah/ui/views/student_info/student_info_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';

import '../../../test_utils/test_devices.dart';
import '../../../test_utils/test_material_app.dart';

void main() {
  group('StudentInfoView |', () {
    late MockActorDetailsNotifier mockActorDetailsNotifier;

    setUp(() {
      mockActorDetailsNotifier = MockActorDetailsNotifier();
    });

    Widget buildTestWidget() {
      return const TestMaterialApp(
        home: StudentInfoView(),
      );
    }

    group('goldens |', () {
      testGoldens(
        'verify screen when empty.',
        (WidgetTester tester) async {
          await tester.pumpWidget(buildTestWidget());

          await multiScreenGolden(
            tester,
            'student_info_view_empty',
            devices: testDevices,
          );
        },
      );

      testGoldens(
        'verify screen when data provided.',
        (WidgetTester tester) async {
          when(() => mockActorDetailsNotifier.actorDetails)
              .thenReturn(FakeActorDetails());

          await tester.pumpWidget(buildTestWidget());

          await multiScreenGolden(
            tester,
            'student_info_view_data_provided',
            devices: testDevices,
          );
        },
      );
    });
  });
}

class MockActorDetailsNotifier extends Mock implements ActorDetailsNotifier {}

class FakeActorDetails extends Fake implements ActorDetails {}
