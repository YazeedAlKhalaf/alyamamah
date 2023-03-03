part of 'themes.dart';

final darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color(0xffF68939),
  ),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
  ),
);
