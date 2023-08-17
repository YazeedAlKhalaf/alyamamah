import 'dart:convert';

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

  bool isJwtExpired() {
    final parts = split('.');
    if (parts.length != 3) {
      return true;
    }

    final payload = parts[1];
    final normalized = base64Url.normalize(payload);
    final resp = utf8.decode(base64Url.decode(normalized));
    final payloadMap = json.decode(resp);
    final exp = payloadMap['exp'];
    if (exp == null) {
      return true;
    }

    final now = DateTime.now().millisecondsSinceEpoch / 1000;
    return now > exp;
  }

  String toTitleCase() {
    return split(' ')
        .map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase())
        .join(' ');
  }

  String toTwoNamesMaximum() {
    final names = split(' ');
    if (names.length <= 2) {
      return this;
    }

    return '${names[0]} ${names[names.length - 1]}';
  }
}
