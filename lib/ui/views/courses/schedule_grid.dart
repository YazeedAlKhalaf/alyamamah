import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:flutter/material.dart';

class ScheduleGrid extends StatelessWidget {
  final double cellHeight;
  final int horizontalSegments;
  final int startHour;

  const ScheduleGrid({
    Key? key,
    required this.cellHeight,
    required this.horizontalSegments,
    required this.startHour,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          size: Size.infinite,
          painter: GridPainter(
            context,
            cellHeight: cellHeight,
            horizontalSegments: horizontalSegments,
          ),
        ),
        CustomPaint(
          size: Size.infinite,
          painter: HourLabelPainter(
            context,
            startHour: startHour,
            cellHeight: cellHeight,
          ),
        ),
      ],
    );
  }
}

class HourLabelPainter extends CustomPainter {
  final BuildContext context;
  final int startHour;
  final double cellHeight;

  HourLabelPainter(
    this.context, {
    required this.startHour,
    required this.cellHeight,
  });

  @override
  void paint(Canvas canvas, Size size) {
    int hour = startHour;
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    for (double y = 0.0; y <= size.height; y += cellHeight) {
      final isPm = hour > 12;
      final tempHour = isPm ? hour - 12 : hour;
      final textSpan = TextSpan(
        text: '$tempHour:00 ${isPm ? context.s.pm : context.s.am}',
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Theme.of(context).colorScheme.outline,
            ),
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: Directionality.of(context),
      );
      textPainter.layout();

      final xOffset = isRtl
          ? size.width + Constants.spacing
          : -textPainter.width - Constants.spacing;

      textPainter.paint(
        canvas,
        Offset(
          xOffset,
          y - (textPainter.height / 3),
        ),
      );
      hour++;
    }
  }

  @override
  bool shouldRepaint(covariant HourLabelPainter oldDelegate) {
    return oldDelegate.cellHeight != cellHeight ||
        oldDelegate.startHour != startHour;
  }
}

class GridPainter extends CustomPainter {
  final BuildContext context;
  final double cellHeight;
  final int horizontalSegments;

  GridPainter(
    this.context, {
    required this.cellHeight,
    required this.horizontalSegments,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Theme.of(context).colorScheme.outlineVariant
      ..strokeWidth = 0.5;

    for (var y = 0.0; y <= size.height; y += cellHeight) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }

    for (var x = 0.0; x <= size.width; x += (size.width / horizontalSegments)) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(GridPainter oldDelegate) {
    return oldDelegate.cellHeight != cellHeight &&
        horizontalSegments != horizontalSegments;
  }
}
