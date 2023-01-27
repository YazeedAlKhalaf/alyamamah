import 'package:alyamamah/core/router/yu_router.dart';
import 'package:alyamamah/core/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: AppWithoutProviderScope(),
    );
  }
}

class AppWithoutProviderScope extends ConsumerWidget {
  const AppWithoutProviderScope({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final yuRouter = ref.read(yuRouterProvider);

    return MaterialApp.router(
      routerDelegate: yuRouter.delegate(),
      routeInformationParser: yuRouter.defaultRouteParser(),
      routeInformationProvider: yuRouter.routeInfoProvider(),
      localizationsDelegates: S.localizationsDelegates,
      supportedLocales: S.supportedLocales,
      theme: Themes.light,
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
