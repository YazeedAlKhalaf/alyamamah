import 'package:alyamamah/core/themes/themes.dart';
import 'package:alyamamah/gen/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TestMaterialApp extends StatelessWidget {
  final List<Override> overrides;
  final ThemeData? theme;
  final Widget? home;
  final List<NavigatorObserver> navigatorObservers;

  const TestMaterialApp({
    super.key,
    this.overrides = const [],
    this.theme,
    this.home,
    this.navigatorObservers = const <NavigatorObserver>[],
  });

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: overrides,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: S.localizationsDelegates,
        supportedLocales: S.supportedLocales,
        theme: theme ?? Themes.light,
        home: home,
        navigatorObservers: navigatorObservers,
      ),
    );
  }
}
