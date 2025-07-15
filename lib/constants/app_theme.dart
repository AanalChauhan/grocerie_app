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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        foregroundColor: Color(0xFFFFF9FF),
        textStyle: TextStyle(fontWeight: FontWeight.w500,fontFamily: "Gilroy",fontSize: 18)
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 26,
        color: AppColors.textsecondary,
        fontWeight: FontWeight.w600,
        fontFamily: "Gilroy",
        letterSpacing: 0.5,
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        fontFamily: "Gilroy",
        color: AppColors.textsecondary,
        letterSpacing: 0.5,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: AppColors.subtext,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        fontFamily: "Gilroy",
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        color: AppColors.smalltext,
        fontWeight: FontWeight.w600,
        fontFamily: "Gilroy",
      ),
    ),
  );
}
