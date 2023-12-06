import 'package:alyamamah/core/providers/feature_flags/feature_flags_state_notifier.dart';
import 'package:alyamamah/core/providers/firebase_analytics/firebase_analytics_provider.dart';
import 'package:alyamamah/core/providers/package_info/package_info_provider.dart';
import 'package:alyamamah/core/router/yu_router.dart';
import 'package:alyamamah/core/services/locale/locale_service.dart';
import 'package:alyamamah/core/services/shared_prefs/shared_prefs_service.dart';
import 'package:alyamamah/core/services/theme/theme_service.dart';
import 'package:alyamamah/core/themes/themes.dart';
import 'package:alyamamah/ui/views/app_disabled/app_disabled_view.dart';
import 'package:alyamamah/ui/widgets/shimmer.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App extends StatelessWidget {
  final SharedPreferences sharedPreferences;
  final PackageInfo packageInfo;
  @visibleForTesting
  final List<Override> overrides;

  const App({
    super.key,
    required this.sharedPreferences,
    required this.packageInfo,
    this.overrides = const [],
  });

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWith((ref) => sharedPreferences),
        packageInfoProvider.overrideWith((ref) => packageInfo),
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
    final isAppEnabled =
        ref.watch(featureFlagsStateNotifierProvider).isAppEnabled;

    return MaterialApp.router(
      routerConfig: yuRouter.config(
        navigatorObservers: () => [
          FirebaseAnalyticsObserver(
            analytics: ref.read(firebaseAnalyticsProvider),
          ),
          SentryNavigatorObserver(),
        ],
      ),
      localizationsDelegates: S.localizationsDelegates,
      supportedLocales: S.supportedLocales,
      locale: localeService.locale,
      themeMode: themeService.themeMode,
      theme: Themes.light,
      darkTheme: Themes.dark,
      builder: (BuildContext context, Widget? child) {
        if (!isAppEnabled) {
          return const AppDisabledView();
        }

        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Shimmer(
            child: child,
          ),
        );
      },
    );
  }
}
