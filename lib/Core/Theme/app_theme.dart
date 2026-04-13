// lib/Core/Theme/app_theme.dart

import 'package:flutter/material.dart';
import 'app_theme_colors.dart';

class AppTheme {

  static ThemeData get lightTheme {
    const colors = AppThemeColors.light;
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: 'Poppins',
      useMaterial3: false,
      scaffoldBackgroundColor: colors.background,
      extensions: const [colors],

      appBarTheme: AppBarTheme(
        backgroundColor: colors.appBarBackground,
        foregroundColor: colors.titleText,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: colors.titleText,
        ),
      ),

      cardTheme: CardThemeData(
        color: colors.card,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.inputFill,
        hintStyle: TextStyle(
          color: colors.hintText,
          fontSize: 13,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.accentOrange, width: 1.5),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.primaryBtn,
          foregroundColor: colors.primaryBtnText,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
      ),

      textTheme: TextTheme(
        headlineLarge: TextStyle(
          color: colors.titleText,
          fontWeight: FontWeight.w700,
          fontSize: 22,
        ),
        headlineMedium: TextStyle(
          color: colors.titleText,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
        bodyLarge: TextStyle(
          color: colors.normalText,
          fontSize: 15,
        ),
        bodyMedium: TextStyle(
          color: colors.normalText,
          fontSize: 13,
        ),
        bodySmall: TextStyle(
          color: colors.subText,
          fontSize: 12,
        ),
      ),

      dividerColor: colors.border,
    );
  }

  // ─────────────────────────────────────
  static ThemeData get darkTheme {
    const colors = AppThemeColors.dark;
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: 'Poppins',
      useMaterial3: false,
      scaffoldBackgroundColor: colors.background,
      extensions: const [colors],

      appBarTheme: AppBarTheme(
        backgroundColor: colors.appBarBackground,
        foregroundColor: colors.titleText,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: colors.titleText,
        ),
      ),

      cardTheme: CardThemeData(
        color: colors.card,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.inputFill,
        hintStyle: TextStyle(
          color: colors.hintText,
          fontSize: 13,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.accentOrange, width: 1.5),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.primaryBtn,
          foregroundColor: colors.primaryBtnText,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
      ),

      textTheme: TextTheme(
        headlineLarge: TextStyle(
          color: colors.titleText,
          fontWeight: FontWeight.w700,
          fontSize: 22,
        ),
        headlineMedium: TextStyle(
          color: colors.titleText,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
        bodyLarge: TextStyle(
          color: colors.normalText,
          fontSize: 15,
        ),
        bodyMedium: TextStyle(
          color: colors.normalText,
          fontSize: 13,
        ),
        bodySmall: TextStyle(
          color: colors.subText,
          fontSize: 12,
        ),
      ),

      dividerColor: colors.border,
    );
  }
}