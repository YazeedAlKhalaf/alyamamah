import 'dart:async';

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
      return const Text('Exam has started');
    }

    // Format the remaining time as you wish
    String formattedTime =
        '${_timeLeft.inDays} days, ${_timeLeft.inHours.remainder(24)} hours, ${_timeLeft.inMinutes.remainder(60)} minutes, ${_timeLeft.inSeconds.remainder(60)} seconds';
    return Text(formattedTime);
  }
}
