import 'dart:async';

import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:flutter/material.dart';

class CountdownTimerWidget extends StatefulWidget {
  final DateTime targetDateTime;
  const CountdownTimerWidget(this.targetDateTime, {super.key});

  @override
  State<CountdownTimerWidget> createState() => _CountdownTimerWidgetState();
}

class _CountdownTimerWidgetState extends State<CountdownTimerWidget> {
  Timer? _timer;
  Duration _timeLeft = const Duration();

  @override
  void initState() {
    super.initState();
    _timeLeft = widget.targetDateTime.difference(DateTime.now());
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _timeLeft = widget.targetDateTime.difference(DateTime.now());
        if (_timeLeft.isNegative) {
          _timer?.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_timeLeft.isNegative) {
      return Container(
        padding: const EdgeInsets.symmetric(
          vertical: Constants.spacing,
          horizontal: Constants.padding,
        ),
        decoration: BoxDecoration(
          color: context.colorScheme.errorContainer,
          borderRadius: BorderRadius.circular(Constants.spacing),
        ),
        child: Text(
          context.s.exam_has_started,
          style: context.textTheme.headlineSmall?.copyWith(
            color: context.colorScheme.onErrorContainer,
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: Constants.spacing,
        horizontal: Constants.padding,
      ),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(Constants.spacing),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildTimePart(_timeLeft.inDays, context.s.days),
          _buildDot(),
          _buildTimePart(_timeLeft.inHours.remainder(24), context.s.hours),
          _buildDot(),
          _buildTimePart(_timeLeft.inMinutes.remainder(60), context.s.min),
          _buildDot(),
          _buildTimePart(_timeLeft.inSeconds.remainder(60), context.s.sec),
        ],
      ),
    );
  }

  Widget _buildTimePart(int timeValue, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          '$timeValue',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.blue.shade700,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade700,
          ),
        ),
      ],
    );
  }

  Widget _buildDot() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 5,
      width: 5,
      decoration: BoxDecoration(
        color: Colors.blue.shade700,
        shape: BoxShape.circle,
      ),
    );
  }
}
