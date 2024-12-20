
import 'package:fe_nike/core/constants/colors.dart';
import 'package:flutter/material.dart';

import 'font_size.dart';

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme.dark(
    brightness: Brightness.dark,
    primary: Color(0xFFFFB0D0),
    tertiary: Colors.white,
    onPrimary: Color(0xFF5C113B),
    primaryContainer: Color(0xFF792952),
    onPrimaryContainer: Color(0xFFFFD8E6),
    secondary: Color(0xFFE1BDCA),
    onSecondary: Color(0xFF412A33),
  ),
  textTheme: const TextTheme(
    headlineMedium: TextStyle(
      color: colorTextWhite,
      fontSize: 30,
      height: 1.2,
      fontFamily: 'Roboto',
      letterSpacing: 0,
    ),
    headlineSmall: TextStyle(
      color: colorTextWhite,
      fontSize: extraBigger,
      fontWeight: FontWeight.bold,
      height: 1.2,
      fontFamily: 'Roboto',
      letterSpacing: 0,
    ),
    titleLarge: TextStyle(
      fontSize: big,  color: colorTextWhite,
      height: 1.2,
      fontFamily: 'Roboto',
      letterSpacing: 0,
      fontWeight: FontWeight.normal,
    ),
    titleMedium: TextStyle(
      fontSize: normal,  color: colorTextWhite,
      height: 1.2,
      fontFamily: 'Roboto',
      letterSpacing: 0,
      fontWeight: FontWeight.normal,
    ),
    titleSmall: TextStyle(
      fontSize: tiny,
      color: colorTextWhite,
      height: 1.2,
      fontFamily: 'Roboto',
      letterSpacing: 0,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: TextStyle(
      fontSize: normal,
      color: colorTextWhite,
      height: 1.2,
      fontFamily: 'Roboto',
      letterSpacing: 0,
      fontWeight: FontWeight.normal,
    ),
    bodyMedium: TextStyle(
      fontSize: small,
      color: colorTextWhite,
      height: 1.2,
      fontFamily: 'Roboto',
      letterSpacing: 0,
      fontWeight: FontWeight.normal,
    ),
    bodySmall: TextStyle(
      fontSize: tiny,
      color: colorTextWhite,
      height: 1.2,
      fontFamily: 'Roboto',
      letterSpacing: 0,
      fontWeight: FontWeight.normal,
    ),
    labelLarge: TextStyle(
      fontSize: normal,
      color: colorTextLabelLight,
      height: 1.2,
      fontFamily: 'Roboto',
      letterSpacing: 0,
      fontWeight: FontWeight.normal,
    ),
    labelMedium: TextStyle(
      fontSize: small,
      color: colorTextLabelLight,height: 1.2,
      fontFamily: 'Roboto',
      letterSpacing: 0,
      fontWeight: FontWeight.normal,
    ),
    labelSmall: TextStyle(
      fontSize: tiny,
      color: colorTextLabelLight,height: 1.2,
      fontFamily: 'Roboto',
      letterSpacing: 0,
      fontWeight: FontWeight.normal,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    outlineBorder: BorderSide(color: Colors.grey.shade800),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.grey.shade800),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.grey.shade300)
      )
  ),
  // iconButtonTheme: IconButtonThemeData(
  //
  // ),
  iconTheme: const IconThemeData(
    size: 28,
    color: Colors.white,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    unselectedIconTheme: IconThemeData(
      color: Colors.white54,
    ),
    selectedIconTheme: IconThemeData(
        color: Color(0xFFF2F2F2)
    ),
    selectedItemColor: Color(0xFFF2F2F2),
    unselectedItemColor: Colors.white54,
    unselectedLabelStyle: TextStyle(color: Colors.white54, fontSize: tiny),
    selectedLabelStyle: TextStyle(color: Color(0xFFF2F2F2), fontSize: tiny),
    backgroundColor: Colors.black87,
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: true,
    showUnselectedLabels: true,
  )
);

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.light(
    primary: const Color(0xff6200ee),
    onPrimary: Colors.white,
    secondary: const Color(0xff03dac6),
    tertiary: Colors.grey[400],
    onSecondary: Colors.black,
    error: const Color(0xffb00020),
    onError: Colors.white,
    surface: Colors.white,
    onSurface: Colors.black,

  ),
  textTheme: const TextTheme(
    headlineMedium: TextStyle(
      color: colorTextBlack,
      fontSize: 30,
      height: 1.2,
      fontFamily: 'Roboto',
      letterSpacing: 0,
    ),
    headlineSmall: TextStyle(
      fontSize: extraBigger,
      color: colorTextBlack,
      fontWeight: FontWeight.bold,
      height: 1.2,
      fontFamily: 'Roboto',
      letterSpacing: 0,
    ),
    titleLarge: TextStyle(
      fontSize: big,
      color: colorTextBlack,
      height: 1.2,
      fontFamily: 'Roboto',
      letterSpacing: 0,
      fontWeight: FontWeight.normal,
    ),
    titleMedium: TextStyle(
      fontSize: normal,  color: colorTextBlack,
      height: 1.2,
      fontFamily: 'Roboto',
      letterSpacing: 0,
      fontWeight: FontWeight.normal,
    ),
    titleSmall: TextStyle(
      fontSize: tiny,
      color: colorTextBlack,
      height: 1.2,
      fontFamily: 'Roboto',
      letterSpacing: 0,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: TextStyle(
      fontSize: normal,
      color: colorTextBlack,
      height: 1.2,
      fontFamily: 'Roboto',
      letterSpacing: 0,
      fontWeight: FontWeight.normal,
    ),
    bodyMedium: TextStyle(
      fontSize: small,
      color: colorTextBlack,
      height: 1.2,
      fontFamily: 'Roboto',
      letterSpacing: 0,
      fontWeight: FontWeight.normal,
    ),
    bodySmall: TextStyle(
      fontSize: tiny,
      color: colorTextBlack,
      height: 1.2,
      fontFamily: 'Roboto',
      letterSpacing: 0,
      fontWeight: FontWeight.normal,
    ),
    labelLarge: TextStyle(
      fontSize: normal,
      color: colorTextLabelLight,
      height: 1.2,
      fontFamily: 'Roboto',
      letterSpacing: 0,
      fontWeight: FontWeight.normal,
    ),
    labelMedium: TextStyle(
      fontSize: small,
      color: colorTextLabelLight,height: 1.2,
      fontFamily: 'Roboto',
      letterSpacing: 0,
      fontWeight: FontWeight.normal,
    ),
    labelSmall: TextStyle(
      fontSize: tiny,
      color: colorTextLabelLight,height: 1.2,
      fontFamily: 'Roboto',
      letterSpacing: 0,
      fontWeight: FontWeight.normal,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    outlineBorder: BorderSide(color: Colors.grey.shade800),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey.shade800),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: BorderSide(color: Colors.grey.shade300)
    )
  ),
  // iconButtonTheme: IconButtonThemeData(
  //
  // ),
  iconTheme: const IconThemeData(
    size: 28,
    color: Colors.black87,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    unselectedIconTheme: IconThemeData(
      color: Colors.grey,
    ),
    selectedIconTheme: IconThemeData(
      color: Colors.black87
    ),
    selectedItemColor: Colors.black87,
    unselectedItemColor: colorTextLabelLight,
    unselectedLabelStyle: TextStyle(color: colorTextLabelLight, fontSize: tiny),
    selectedLabelStyle: TextStyle(color: colorTextBlack, fontSize: tiny),
    backgroundColor: Colors.white,
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: true,
    showUnselectedLabels: true,
  ),


);