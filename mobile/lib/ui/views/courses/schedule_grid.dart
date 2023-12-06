import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/providers/feature_flags/feature_flags_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScheduleGrid extends ConsumerWidget {
  final double cellHeight;
  final int horizontalSegments;
  final int startHour;
  final double scrollOffset;

  const ScheduleGrid({
    super.key,
    required this.cellHeight,
    required this.horizontalSegments,
    required this.startHour,
    required this.scrollOffset,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isScheduleHourLabelsEnabled = ref
        .watch(featureFlagsStateNotifierProvider)
        .isScheduleHourLabelsEnabled;

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
        if (isScheduleHourLabelsEnabled)
          CustomPaint(
            size: Size.infinite,
            painter: HourLabelPainter(
              context,
              startHour: startHour,
              cellHeight: cellHeight,
              scrollOffset: scrollOffset,
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
  final double scrollOffset;

  HourLabelPainter(
    this.context, {
    required this.startHour,
    required this.cellHeight,
    required this.scrollOffset,
  });

  @override
  void paint(Canvas canvas, Size size) {
    int hour = startHour;
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    for (double y = 0.0; y <= size.height; y += cellHeight) {
      final isPm = hour > 12;
      final tempHour = isPm ? hour - 12 : hour;
      final textSpan = TextSpan(
        text:
            '$tempHour${isPm ? context.s.pm.toLowerCase() : context.s.am.toLowerCase()}',
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Theme.of(context).colorScheme.outline,
            ),
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: Directionality.of(context),
      );
      textPainter.layout();

      const padding = Constants.spacing / 2;
      final xOffset =
          isRtl ? size.width + padding : -textPainter.width - (padding / 3);
      final centeringAmount = textPainter.height / 3;
      textPainter.paint(
        canvas,
        Offset(
          xOffset,
          y - centeringAmount - scrollOffset,
        ),
      );
      hour++;
    }
  }

  @override
  bool shouldRepaint(covariant HourLabelPainter oldDelegate) {
    return oldDelegate.cellHeight != cellHeight ||
        oldDelegate.startHour != startHour ||
        oldDelegate.scrollOffset != scrollOffset;
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
