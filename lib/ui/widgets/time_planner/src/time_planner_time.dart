import 'package:flutter/material.dart';

import './config/global_config.dart' as config;

/// Show the hour for each row of time planner
class TimePlannerTime extends StatelessWidget {
  /// Text it will be show as hour
  final String? time;

  /// Show the hour for each row of time planner
  const TimePlannerTime({
    Key? key,
    this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: config.cellHeight!.toDouble() - 1,
      width: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(time!),
        ],
      ),
    );
  }
}
