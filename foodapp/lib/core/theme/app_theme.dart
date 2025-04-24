import 'package:flutter/material.dart';
import '../constants/color_constants.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: ColorConstants.primary,
    scaffoldBackgroundColor: ColorConstants.scaffoldBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorConstants.scaffoldBackground,
      elevation: 0,
      iconTheme: IconThemeData(color: ColorConstants.primary),
      titleTextStyle: TextStyle(
        fontSize: 36,
        color: ColorConstants.primary,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontSize: 36,
        color: ColorConstants.primary,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(fontSize: 18),
      bodyMedium: TextStyle(fontSize: 16),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorConstants.primary,
        foregroundColor: ColorConstants.white,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: ColorConstants.primary, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    ),
  );
}
