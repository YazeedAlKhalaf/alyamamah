part of 'themes.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: const Color(0xffF68939),
  ),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
  ),
  fontFamily: 'Tajawal',
);
