import 'dart:developer';

import 'package:alyamamah/core/app.dart';
import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sentry_logging/sentry_logging.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:stack_trace/stack_trace.dart' as stack_trace;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // This is used for debugging an error when riverpod somehow
  // takes over the exception instead of the regular path.
  // reference: https://github.com/rrousselGit/riverpod/issues/1874
  // FlutterError.demangleStackTrace = (StackTrace stack) {
  //   if (stack is stack_trace.Trace) return stack.vmTrace;
  //   if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
  //   return stack;
  // };

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

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final sharedPreferences = await SharedPreferences.getInstance();
  final packageInfo = await PackageInfo.fromPlatform();

  if (kDebugMode) {
    runApp(App(
      sharedPreferences: sharedPreferences,
      packageInfo: packageInfo,
    ));
  } else {
    await SentryFlutter.init(
      (SentryFlutterOptions options) {
        options.dsn = Constants.sentryDsn;
        options.addIntegration(LoggingIntegration());
        options.enableTracing = true;
        options.sampleRate = 1;
        options.attachScreenshot = true;
        options.attachViewHierarchy = true;
        options.autoAppStart = true;
        options.enableAppHangTracking = true;
        options.enableUserInteractionBreadcrumbs = true;
        options.enableUserInteractionTracing = true;
        options.enableBreadcrumbTrackingForCurrentPlatform();

        // uncomment this to enable debug mode, in debug mode only.
        // assert(() {
        //   options.debug = true;

        //   return true;
        // }());
      },
      appRunner: () => runApp(
        SentryUserInteractionWidget(
          child: SentryScreenshotWidget(
            child: App(
              sharedPreferences: sharedPreferences,
              packageInfo: packageInfo,
            ),
          ),
        ),
      ),
    );
  }
}
