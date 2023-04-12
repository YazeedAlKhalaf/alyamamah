import 'package:flutter/material.dart';

class ScheduleGrid extends StatelessWidget {
  final double cellHeight;
  final int horizontalSegments;

  const ScheduleGrid({
    super.key,
    required this.cellHeight,
    required this.horizontalSegments,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.infinite,
      painter: GridPainter(
        cellHeight: cellHeight,
        horizontalSegments: horizontalSegments,
      ),
    );
  }
}

class GridPainter extends CustomPainter {
  final double cellHeight;
  final int horizontalSegments;

  GridPainter({
    required this.cellHeight,
    required this.horizontalSegments,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.withOpacity(0.3)
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
