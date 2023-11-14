import 'dart:math';

import 'package:flutter/material.dart';

ThemeData lightTheme(bool tyFontOff) {
  return ThemeData(
    primaryColor: const Color.fromRGBO(191, 194, 183, 1),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromRGBO(191, 194, 183, 0.5),
      iconTheme: IconThemeData(color: Colors.black),
      foregroundColor: Colors.black,
    ),
    cardTheme: const CardTheme(color: Color.fromRGBO(191, 194, 183, 0.69)),
    scrollbarTheme: ScrollbarThemeData(
      thumbColor:
          MaterialStateProperty.all(const Color.fromRGBO(66, 65, 62, 1)),
      trackColor:
          MaterialStateProperty.all(const Color.fromRGBO(191, 194, 183, 0.5)),
      trackVisibility: MaterialStateProperty.all(true),
      thumbVisibility: MaterialStateProperty.all(true),
    ),
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
          overlayColor:
              tyButtonOverlay(const Color.fromRGBO(191, 194, 183, 1))),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconSize: MaterialStateProperty.all(45.0),
        backgroundColor: MaterialStateProperty.all(
          const Color.fromRGBO(191, 194, 183, 0.8),
        ),
        foregroundColor: MaterialStateProperty.all(Colors.black),
        overlayColor: tyButtonOverlay(
          const Color.fromRGBO(191, 194, 183, 0.8),
        ),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            side: BorderSide(width: 0.5, color: Color.fromRGBO(66, 65, 62, 1)),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(
        const Color.fromRGBO(191, 194, 183, 1),
      ),
      trackColor: MaterialStateProperty.all(
        const Color.fromRGBO(66, 65, 62, 0.6),
      ),
      trackOutlineColor: MaterialStateProperty.all(
        const Color.fromRGBO(191, 194, 183, 1),
      ),
      trackOutlineWidth: MaterialStateProperty.all(0.8),
    ),
    textTheme:
        tyFontOff ? ubuTextTheme(Colors.black) : tyTextTheme(Colors.black),
    iconTheme: const IconThemeData(color: Colors.black),
    useMaterial3: true,
  );
}

// dark theme will be applied when switch is toggled off
// const Color.fromRGBO(191, 194, 183, 1)
ThemeData darkTheme(bool tyFontOff) {
  return ThemeData(
    primaryColor: const Color.fromRGBO(66, 65, 62, 1),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromRGBO(66, 65, 62, 0.5),
      iconTheme: IconThemeData(color: Colors.white),
      foregroundColor: Colors.white,
    ),
    cardTheme: const CardTheme(
      color: Color.fromRGBO(66, 65, 62, 0.69),
    ),
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: MaterialStateProperty.all(
        const Color.fromRGBO(191, 194, 183, 1),
      ),
      trackColor: MaterialStateProperty.all(
        const Color.fromRGBO(66, 65, 62, 0.5),
      ),
      trackVisibility: MaterialStateProperty.all(true),
      thumbVisibility: MaterialStateProperty.all(true),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color.fromRGBO(66, 65, 62, 1),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          const Color.fromRGBO(66, 65, 62, 1),
        ),
        foregroundColor:
            MaterialStateProperty.all(const Color.fromRGBO(28, 146, 245, 1)),
        overlayColor: tyButtonOverlay(
          const Color.fromRGBO(66, 65, 62, 1),
        ),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            side:
                BorderSide(width: 0.5, color: Color.fromRGBO(191, 194, 183, 1)),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
          foregroundColor:
              MaterialStateProperty.all(const Color.fromRGBO(28, 146, 245, 1)),
          overlayColor: tyButtonOverlay(
            const Color.fromRGBO(66, 65, 62, 1),
          )),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconSize: MaterialStateProperty.all(45.0),
        backgroundColor: MaterialStateProperty.all(
          const Color.fromRGBO(66, 65, 62, 0.8),
        ),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        overlayColor: tyButtonOverlay(
          const Color.fromRGBO(66, 65, 62, 0.8),
        ),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            side:
                BorderSide(width: 0.5, color: Color.fromRGBO(191, 194, 183, 1)),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(
        const Color.fromRGBO(66, 65, 62, 1),
      ),
      trackColor: MaterialStateProperty.all(
        const Color.fromRGBO(191, 194, 183, 0.3),
      ),
      trackOutlineColor: MaterialStateProperty.all(
        const Color.fromRGBO(66, 65, 62, 1),
      ),
      trackOutlineWidth: MaterialStateProperty.all(0.8),
    ),
    textTheme:
        tyFontOff ? ubuTextTheme(Colors.white) : tyTextTheme(Colors.white),
    iconTheme: const IconThemeData(color: Colors.white),
    useMaterial3: true,
  );
}

// ty font text theme
// based off the 2021 material design typography - https://api.flutter.dev/flutter/material/TextTheme-class.html
// with a slight adjustment (4 points) due to my font being small
TextTheme tyTextTheme(Color color) {
  return TextTheme(
    displayLarge: tyFont(61, color),
    displayMedium: tyFont(49, color),
    displaySmall: tyFont(40, color),
    headlineLarge: tyFont(36, color),
    headlineMedium: tyFont(32, color),
    headlineSmall: tyFont(28, color),
    titleLarge: tyFont(26, color),
    titleMedium: tyFont(20, color),
    titleSmall: tyFont(18, color),
    labelLarge: tyFont(18, color),
    labelMedium: tyFont(16, color),
    labelSmall: tyFont(15, color),
    bodyLarge: tyFont(20, color, false),
    bodyMedium: tyFont(18, color, false),
    bodySmall: tyFont(16, color, false),
  );
}

// ubuntu font text theme
// based off the 2021 material design typography - https://api.flutter.dev/flutter/material/TextTheme-class.html
// with a slight adjustment (2 points) to match my ty
TextTheme ubuTextTheme(Color color) {
  return TextTheme(
    displayLarge: ubuFont(61, color),
    displayMedium: ubuFont(49, color),
    displaySmall: ubuFont(40, color),
    headlineLarge: ubuFont(36, color),
    headlineMedium: ubuFont(32, color),
    headlineSmall: ubuFont(28, color),
    titleLarge: ubuFont(26, color),
    titleMedium: ubuFont(20, color),
    titleSmall: ubuFont(18, color),
    labelLarge: ubuFont(18, color),
    labelMedium: ubuFont(16, color),
    labelSmall: ubuFont(15, color),
    bodyLarge: ubuFont(20, color),
    bodyMedium: ubuFont(18, color),
    bodySmall: ubuFont(16, color),
  );
}

// reusable textstyle for just changing size
TextStyle tyFont(fontSize, fontColor, [bold = true]) {
  return TextStyle(
    fontFamily: 'Tyrowo Inked',
    color: fontColor,
    fontWeight: bold ? FontWeight.w600 : FontWeight.w300,
    fontSize: fontSize,
  );
}

// reusable textstyle for just changing size
TextStyle ubuFont(fontSize, fontColor) {
  return TextStyle(
    fontFamily: 'Ubuntu',
    color: fontColor,
    fontSize: fontSize,
  );
}

// reusable button overlay for text and elevated buttons
MaterialStateProperty<Color> tyButtonOverlay(Color initColor) {
  return MaterialStateProperty.resolveWith((Set<MaterialState> state) {
    if (state.contains(MaterialState.pressed) ||
        state.contains(MaterialState.selected)) {
      return const Color.fromRGBO(28, 146, 245, 1);
    } else if (state.contains(MaterialState.focused) ||
        state.contains(MaterialState.hovered)) {
      int time = DateTime.now().second;
      if (time % 2 == 0) {
        return const Color.fromRGBO(251, 80, 201, 0.5);
      } else {
        return const Color.fromRGBO(7, 214, 105, 0.75);
      }
    } else {
      return initColor;
    }
  });
}

// found a user on github who created this class to scale text with viewport size
class ScaleSize {
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 1}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return min(val, maxTextScaleFactor);
  }
}
