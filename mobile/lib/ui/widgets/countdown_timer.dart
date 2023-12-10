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
  final Duration _examDuration = const Duration(hours: 2);
  bool _examStarted = false;

  @override
  void initState() {
    super.initState();
    _initializeTimeLeft();
    _startTimer();
  }

  void _initializeTimeLeft() {
    var now = DateTime.now();
    if (now.isBefore(widget.targetDateTime)) {
      _timeLeft = widget.targetDateTime.difference(now);
    } else if (now.isBefore(widget.targetDateTime.add(_examDuration))) {
      _timeLeft = widget.targetDateTime.add(_examDuration).difference(now);
      _examStarted = true;
    } else {
      _timeLeft = Duration.zero;
    }
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        var now = DateTime.now();
        if (now.isBefore(widget.targetDateTime)) {
          _timeLeft = widget.targetDateTime.difference(now);
          _examStarted = false;
        } else if (now.isBefore(widget.targetDateTime.add(_examDuration))) {
          _timeLeft = widget.targetDateTime.add(_examDuration).difference(now);
          _examStarted = true;
        } else {
          _timeLeft = Duration.zero;
          _examStarted = false;
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
    if (_timeLeft.isNegative || _timeLeft == Duration.zero) {
      return _buildExamEndedWidget(context);
    }
    return _buildCountdownWidget(context);
  }

  Widget _buildExamEndedWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Constants.padding),
      decoration: BoxDecoration(
        color: context.colorScheme.tertiary,
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            context.s.exam_ended,
            style: context.textTheme.headlineLarge?.copyWith(
              color: context.colorScheme.onTertiary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildCountdownWidget(BuildContext context) {
    String statusText =
        _examStarted ? context.s.exam_ends_in : context.s.exam_starts_in;
    Color statusColor =
        _examStarted ? Colors.red.shade700 : Colors.blue.shade700;

    return Container(
      padding: const EdgeInsets.all(Constants.spacing),
      decoration: BoxDecoration(
        color: _examStarted ? Colors.red.shade100 : Colors.blue.shade100,
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      child: Column(
        children: [
          Text(
            statusText,
            style: context.textTheme.titleMedium?.copyWith(
              color: statusColor,
            ),
          ),
          const SizedBox(height: Constants.spacing),
          Row(
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
            color: _examStarted ? Colors.red.shade700 : Colors.blue.shade700,
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
        color: _examStarted ? Colors.red.shade700 : Colors.blue.shade700,
        shape: BoxShape.circle,
      ),
    );
  }
}
