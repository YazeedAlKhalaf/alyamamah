import 'package:alyamamah/app/provider/locale_provider.dart';
import 'package:alyamamah/l10n/l10n.dart';
import 'package:alyamamah/login/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);

    return MaterialApp(
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      locale: locale,
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
          bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      home: const LoginPage(),
    );
  }
}
