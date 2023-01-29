import 'dart:developer';

import 'package:alyamamah/core/app.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord logRecord) {
    log(
      logRecord.message,
      time: logRecord.time,
      sequenceNumber: logRecord.sequenceNumber,
      level: logRecord.level.value,
      name: logRecord.loggerName,
      zone: logRecord.zone,
      error: logRecord.error,
      stackTrace: logRecord.stackTrace,
    );
  });

  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(App(
    sharedPreferences: sharedPreferences,
  ));
}
