import 'package:alyamamah/core/providers/firebase_analytics/firebase_analytics_provider.dart';
import 'package:alyamamah/core/router/yu_router.dart';
import 'package:alyamamah/core/services/locale/locale_service.dart';
import 'package:alyamamah/core/services/shared_prefs/shared_prefs_service.dart';
import 'package:alyamamah/core/services/theme/theme_service.dart';
import 'package:alyamamah/core/themes/themes.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App extends StatelessWidget {
  final SharedPreferences sharedPreferences;
  @visibleForTesting
  final List<Override> overrides;

  const App({
    super.key,
    required this.sharedPreferences,
    this.overrides = const [],
  });

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWith((ref) => sharedPreferences),
        ...overrides,
      ],
      child: const AppWithoutProviderScope(),
    );
  }
}

class AppWithoutProviderScope extends ConsumerWidget {
  const AppWithoutProviderScope({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final yuRouter = ref.read(yuRouterProvider);
    final themeService = ref.watch(themeServiceProvider);
    final localeService = ref.watch(localeServiceProvider);

    return MaterialApp.router(
      routerConfig: yuRouter.config(
        navigatorObservers: () => [
          FirebaseAnalyticsObserver(
            analytics: ref.read(firebaseAnalyticsProvider),
          ),
        ],
      ),
      localizationsDelegates: S.localizationsDelegates,
      supportedLocales: S.supportedLocales,
      locale: localeService.locale,
      themeMode: themeService.themeMode,
      theme: Themes.light,
      darkTheme: Themes.dark,
      builder: (BuildContext context, Widget? child) {
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: child,
        );
      },
    );
  }
}
