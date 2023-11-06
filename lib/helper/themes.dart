import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: const Color.fromRGBO(191, 194, 183, 0.8),
  appBarTheme:
      const AppBarTheme(backgroundColor: Color.fromRGBO(191, 194, 183, 0.35)),
  cardTheme: const CardTheme(color: Color.fromRGBO(191, 194, 183, 0.9)),
  scrollbarTheme: ScrollbarThemeData(
      thumbColor:
          MaterialStateProperty.all(const Color.fromRGBO(191, 194, 183, 1)),
      trackColor: MaterialStateProperty.all(Colors.black)),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color.fromRGBO(191, 194, 183, 1),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor:
          MaterialStateProperty.all(const Color.fromRGBO(191, 194, 183, 1)),
      foregroundColor:
          MaterialStateProperty.all(const Color.fromRGBO(28, 146, 245, 1)),
      overlayColor: tyButtonOverlay(const Color.fromRGBO(191, 194, 183, 1)),
      shape: MaterialStateProperty.all(
        const RoundedRectangleBorder(
          side: BorderSide(width: 0.5, color: Color.fromRGBO(66, 65, 62, 1)),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
        foregroundColor:
            MaterialStateProperty.all(const Color.fromRGBO(28, 146, 245, 1)),
        overlayColor: tyButtonOverlay(const Color.fromRGBO(191, 194, 183, 1))),
  ),
  useMaterial3: true,
);

// dark theme will be applied when switch is toggled off
ThemeData darkTheme = ThemeData(
  colorScheme:
      ColorScheme.fromSeed(seedColor: const Color.fromRGBO(66, 65, 62, 1)),
  useMaterial3: true,
);

// reusable button overlay for text and elevated buttons
MaterialStateProperty<Color> tyButtonOverlay(Color initColor) {
  return MaterialStateProperty.resolveWith((Set<MaterialState> state) {
    if (state.contains(MaterialState.pressed) ||
        state.contains(MaterialState.selected)) {
      return const Color.fromRGBO(7, 214, 105, 0.75);
    } else if (state.contains(MaterialState.focused) ||
        state.contains(MaterialState.hovered)) {
      return const Color.fromRGBO(251, 80, 201, 0.5);
    } else {
      return initColor;
    }
  });
}
