import 'package:flutter/material.dart';
import 'package:breast_onco/themes/colors.dart';

class ThemeStyle {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: kLightColor,
      iconTheme: IconThemeData(color: kSecondarySwatchColor),
      foregroundColor: kSecondarySwatchColor,
      surfaceTintColor: kLightColor,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kSecondarySwatchColor),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        // Don't edit backgroundColor, foregroundColor
        backgroundColor: MaterialStateProperty.all(kSecondarySwatchColor.shade100),
        foregroundColor: MaterialStateProperty.all(kSecondarySwatchColor),
      ),
    ),
    menuButtonTheme: MenuButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kSecondarySwatchColor),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kSecondarySwatchColor),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kSecondarySwatchColor),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kLightColor),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(color: kSecondarySwatchColor),
        ),
      ),
    ),
    segmentedButtonTheme: SegmentedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kSecondarySwatchColor),
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: kLightColor,
      todayBackgroundColor: MaterialStatePropertyAll(kSecondarySwatchColor),
      confirmButtonStyle: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kSecondarySwatchColor),
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateColor.resolveWith(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return kSecondarySwatchColor;
          }
          return kTextColor;
        },
      ),
    ),
    scaffoldBackgroundColor: kLightColor,
    primarySwatch: kSecondarySwatchColor,
    dialogBackgroundColor: kLightColor,
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: kLightColor),
    textTheme: TextTheme(
      displayLarge: TextStyle(fontFamily: 'Montserrat', color: kSecondarySwatchColor),
      displayMedium: TextStyle(fontFamily: 'Montserrat', color: kSecondarySwatchColor),
      displaySmall: TextStyle(fontFamily: 'Montserrat', color: kSecondarySwatchColor),
      // Don't edit
      headlineLarge: TextStyle(fontFamily: 'Montserrat', color: kSecondarySwatchColor, fontSize: 26.0),
      // Don't edit
      headlineMedium: TextStyle(fontFamily: 'Montserrat', color: kSecondarySwatchColor.shade700, fontSize: 20),
      // Don't edit
      headlineSmall: TextStyle(fontFamily: 'Montserrat', color: kSecondarySwatchColor.shade700, fontSize: 22),
      titleLarge: TextStyle(fontFamily: 'Montserrat', color: kSecondarySwatchColor),
      titleMedium: TextStyle(fontFamily: 'Montserrat', color: kSecondarySwatchColor),
      titleSmall: TextStyle(fontFamily: 'Montserrat', color: kSecondarySwatchColor),
      // Don't edit
      bodyLarge: const TextStyle(fontFamily: 'Montserrat'),
      bodyMedium: TextStyle(fontFamily: 'Montserrat', color: kSecondarySwatchColor),
      bodySmall: TextStyle(fontFamily: 'Montserrat', color: kSecondarySwatchColor),
      labelLarge: TextStyle(fontFamily: 'Montserrat', color: kSecondarySwatchColor),
      labelMedium: TextStyle(fontFamily: 'Montserrat', color: kSecondarySwatchColor),
      labelSmall: TextStyle(fontFamily: 'Montserrat', color: kSecondarySwatchColor),
    ),
  );
}
