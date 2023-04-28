import 'package:flutter/material.dart';

extension StringX on String {
  TimeOfDay mapToTimeOfDay() {
    // ' 11:30 AM '
    final trimmed = trim();

    // first ['11:30', 'AM']
    // then ['11', '30']
    final timeParts = trimmed.split(' ')[0].split(':');
    int hour = int.parse(timeParts[0].trim());
    int minute = int.parse(timeParts[1].trim());

    final isPM = (trimmed.contains('pm') ||
            trimmed.contains('PM') ||
            trimmed.contains('م')) &&
        hour != 12;

    if (isPM) {
      hour += 12;
    }

    return TimeOfDay(hour: hour, minute: minute);
  }

  bool isValidUrl() {
    final RegExp regex = RegExp(
      r'^(https?:\/\/)?' // Optional protocol (http or https)
      r'(?:[a-zA-Z0-9-]+\.)+[a-zA-Z]{2,6}' // Domain with subdomains (e.g., www.example.com)
      r'(?:\/[^\s]*)?' // Optional path (e.g., /some/path)
      r'(?:\?[^\s]*)?' // Optional query string (e.g., ?query=value)
      r'(?:#\S*)?' // Optional fragment (e.g., #section)
      r'$',
      caseSensitive: false, // Make the pattern case-insensitive
    );
    return regex.hasMatch(this);
  }
}
