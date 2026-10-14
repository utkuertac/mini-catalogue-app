import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Colors.white;
  static const Color primary = Color(0xFF111111);
  static const Color textSecondary = Color(0xFF8A8A8E);
  static const Color price = Color(0xFF0A7AFF);
  static const Color surface = Color(0xFFF4F4F6);
}

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        surface: AppColors.background,
      ),
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.primary,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
    );
  }
}
