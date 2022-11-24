import 'package:alyamamah/app/provider/authentication_provider.dart';
import 'package:alyamamah/app/provider/locale_provider.dart';
import 'package:alyamamah/app/router/app_router.dart';
import 'package:alyamamah/app/view/splash_page.dart';
import 'package:alyamamah/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  void initState() {
    super.initState();

    updateLocale();
  }

  Future<void> updateLocale() async {
    final localeNotifier = ref.read(localeProvider.notifier);
    await localeNotifier.updateLocale();
  }

  @override
  Widget build(BuildContext context) {
    final locale = ref.watch(localeProvider);
    final authenticationState = ref.watch(authenticationProvider);
    final goRouter = AppRouter.getGoRouter(
      loggedIn: authenticationState.isLoggedIn,
    );

    return MaterialApp.router(
      routerDelegate: goRouter.routerDelegate,
      routeInformationParser: goRouter.routeInformationParser,
      routeInformationProvider: goRouter.routeInformationProvider,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      locale: locale,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        fontFamily: 'Cairo',
        useMaterial3: true,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xff974800),
          onPrimary: Color(0xffFFFFFF),
          primaryContainer: Color(0xffFFDBC7),
          onPrimaryContainer: Color(0xff311300),
          inversePrimary: Color(0xffFFB688),
          secondary: Color(0xff755846),
          onSecondary: Color(0xffFFFFFF),
          secondaryContainer: Color(0xffFFDBC7),
          onSecondaryContainer: Color(0xff2B1709),
          tertiary: Color(0xff606134),
          onTertiary: Color(0xffFFFFFF),
          tertiaryContainer: Color(0xffE7E6AD),
          onTertiaryContainer: Color(0xff1C1D00),
          error: Color(0xffBA1A1A),
          onError: Color(0xffBA1A1A),
          errorContainer: Color(0xffFFDAD6),
          onErrorContainer: Color(0xff410002),
          background: Color(0xffFFFBFF),
          onBackground: Color(0xff201A17),
          surface: Color(0xffFFFBFF),
          onSurface: Color(0xff201A17),
          inverseSurface: Color(0xff362F2B),
          onInverseSurface: Color(0xffFBEEE8),
          surfaceTint: Color(0xff974800),
          surfaceVariant: Color(0xffF4DED3),
          outline: Color(0xff84746A),
          onSurfaceVariant: Color(0xff52443C),
          outlineVariant: null,
          shadow: Color(0xff000000),
          scrim: null,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Colors.black,
            fontSize: 57,
            fontWeight: FontWeight.normal,
          ),
          headlineLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.normal,
          ),
          labelLarge: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      darkTheme: ThemeData(
        fontFamily: 'Cairo',
        useMaterial3: true,
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xffFFB688),
          onPrimary: Color(0xff512400),
          primaryContainer: Color(0xff733500),
          onPrimaryContainer: Color(0xffFFDBC7),
          inversePrimary: Color(0xff974800),
          secondary: Color(0xffE5BFA9),
          onSecondary: Color(0xff432B1C),
          secondaryContainer: Color(0xff5B4130),
          onSecondaryContainer: Color(0xffFFDBC7),
          tertiary: Color(0xffCAC993),
          onTertiary: Color(0xff32320A),
          tertiaryContainer: Color(0xff48491E),
          onTertiaryContainer: Color(0xffE7E6AD),
          error: Color(0xffFFB4AB),
          onError: Color(0xff690005),
          errorContainer: Color(0xff93000A),
          onErrorContainer: Color(0xffFFDAD6),
          background: Color(0xff201A17),
          onBackground: Color(0xffECE0DA),
          surface: Color(0xff201A17),
          onSurface: Color(0xffECE0DA),
          inverseSurface: Color(0xffECE0DA),
          onInverseSurface: Color(0xff362F2B),
          surfaceTint: Color(0xffFFB688),
          surfaceVariant: Color(0xff52443C),
          onSurfaceVariant: Color(0xffD7C3B8),
          outline: Color(0xff9F8D83),
          outlineVariant: null,
          shadow: Color(0xff000000),
          scrim: null,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Colors.white,
            fontSize: 57,
            fontWeight: FontWeight.normal,
          ),
          headlineLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.normal,
          ),
          labelLarge: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      builder: (BuildContext context, Widget? child) {
        if (authenticationState.isGettingLoginInfo) {
          return const SplashPage();
        }

        return child!;
      },
    );
  }
}
