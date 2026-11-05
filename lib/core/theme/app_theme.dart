import 'package:flutter/material.dart';

class AppColors {
  static const Color primario = Color(0xFF8D5524);
  static const Color primarioClaro = Color(0xFFF1E6D6);
  static const Color acento = Color(0xFFD7263D);
  static const Color textoPrincipal = Color(0xFF2B1B14);
  static const Color textoSecundario = Color(0xFF6D5A4E);
  static const Color fondo = Color(0xFFFBF7F0);
}

class AppSpacing {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
}

ThemeData buildPethomeTheme() {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.fondo,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primario,
      primary: AppColors.primario,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primario,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: AppColors.textoPrincipal,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(fontSize: 14, color: AppColors.textoSecundario),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size.fromHeight(56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primario,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}
