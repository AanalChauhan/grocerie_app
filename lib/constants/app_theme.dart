import 'package:flutter/material.dart';
import 'package:grocerie_app/constants/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = new ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: AppColors.textprimary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        foregroundColor: Color(0xFFFFF9FF),
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 26,
        color: AppColors.textsecondary,
        fontWeight: FontWeight.w600,
        fontFamily: "Gilroy",
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: AppColors.subtext,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
