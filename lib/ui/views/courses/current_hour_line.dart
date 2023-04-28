import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/int.dart';
import 'package:alyamamah/core/models/day.dart';
import 'package:flutter/material.dart';

class CurrentHourLine extends StatelessWidget {
  final double offset;
  final int startHour;
  final double cellHeight;

  const CurrentHourLine({
    super.key,
    required this.offset,
    required this.startHour,
    required this.cellHeight,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final nowDay = now.weekday.mapToDay();
    final showOnRight =
        nowDay == Day.sat || nowDay == Day.fri || nowDay == Day.sun;

    final result = [
      const SizedBox(width: Constants.spacing),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.8),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          '${now.hour}:${now.minute.toString().padLeft(2, '0')}',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
      ),
      Expanded(
        child: Container(
          height: 1,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 1),
                blurRadius: 2,
                color: Colors.green.withOpacity(0.3),
              ),
            ],
          ),
        ),
      ),
    ];

    return Positioned(
      top: -offset +
          (((now.hour - startHour) * 60) + now.minute) * cellHeight / 60,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: showOnRight ? result.reversed.toList() : result,
      ),
    );
  }
}
