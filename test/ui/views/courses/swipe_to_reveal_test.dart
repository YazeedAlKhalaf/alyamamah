import 'package:alyamamah/ui/views/courses/swipe_to_reveal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'SwipeToReveal works with LTR layout',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Directionality(
              textDirection: TextDirection.ltr,
              child: SwipeToReveal(
                child: Container(color: Colors.red),
              ),
            ),
          ),
        ),
      );

      final containerFinder = find.byType(Container);
      final initialOffset = tester.getTopLeft(containerFinder);

      // Perform a drag gesture to the right
      await tester.drag(containerFinder, const Offset(200, 0));
      await tester.pump();

      // Verify the container has been dragged to the right
      final draggedOffset = tester.getTopLeft(containerFinder);
      expect(draggedOffset.dx, 200);

      // Release the drag gesture and verify the container returns to the original position
      await tester.pumpAndSettle();
      expect(tester.getTopLeft(containerFinder), initialOffset);
    },
  );

  testWidgets(
    'SwipeToReveal works with RTL layout',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Directionality(
              textDirection: TextDirection.rtl,
              child: SwipeToReveal(
                child: Container(color: Colors.red),
              ),
            ),
          ),
        ),
      );

      final containerFinder = find.byType(Container);
      final initialOffset = tester.getTopLeft(containerFinder);

      // Perform a drag gesture to the left
      await tester.drag(containerFinder, const Offset(-200, 0));
      await tester.pump();

      // Verify the container has been dragged to the left
      final draggedOffset = tester.getTopLeft(containerFinder);
      expect(draggedOffset.dx, -200);

      // Release the drag gesture and verify the container returns to the original position
      await tester.pumpAndSettle();
      expect(tester.getTopLeft(containerFinder), initialOffset);
    },
  );
}
