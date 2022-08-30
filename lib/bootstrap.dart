import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

final bootstrapLog = Logger('bootstrap');

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord record) {
    log(
      record.message,
      name: record.loggerName,
      time: record.time,
      level: record.level.value,
    );
  });

  await runZonedGuarded(
    () async => runApp(
      await builder(),
    ),
    (error, stack) {
      bootstrapLog.severe('some error');
    },
  );
}
