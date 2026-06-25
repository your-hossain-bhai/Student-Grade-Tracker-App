import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF5D3FD3), // Deep Indigo
        onPrimary: Colors.white,
        primaryContainer: Color(0xFFEDE9FE), // Light Violet
        onPrimaryContainer: Color(0xFF6D28D9), // Deep Violet
        secondary: Color(0xFF0D9488), // Teal/Secondary (representing passing grade)
        onSecondary: Colors.white,
        secondaryContainer: Color(0xFFCCFBF1), // Light Teal
        onSecondaryContainer: Color(0xFF0F766E), // Deep Teal
        surface: Color(0xFFF8FAFC), // Off-white/slate-50
        onSurface: Color(0xFF0F172A), // Dark slate-900
        error: Color(0xFFEF4444), // Crimson Red (representing failing grade)
        onError: Colors.white,
        errorContainer: Color(0xFFFEE2E2), // Light Red
        onErrorContainer: Color(0xFF991B1B), // Deep Red
        outline: Color(0xFFCBD5E1), // Slate-300
      ),
      scaffoldBackgroundColor: const Color(0xFFF1F5F9), // Soft slate background
      cardTheme: const CardThemeData(
        color: Colors.white,
        elevation: 2,
        shadowColor: Color(0x1A0F172A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF5D3FD3),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF5D3FD3), width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFEF4444)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFEF4444), width: 2),
        ),
        labelStyle: const TextStyle(color: Color(0xFF64748B)),
        hintStyle: const TextStyle(color: Color(0xFF94A3B8)),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xFF5D3FD3),
        unselectedItemColor: Color(0xFF94A3B8),
        elevation: 8,
      ),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
        titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
        bodyLarge: TextStyle(fontSize: 16, color: Color(0xFF334155)),
        bodyMedium: TextStyle(fontSize: 14, color: Color(0xFF64748B)),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF8B5CF6), // Bright Violet
        onPrimary: Colors.white,
        primaryContainer: Color(0xFF4C1D95), // Dark Violet
        onPrimaryContainer: Color(0xFFDDD6FE), // Lavender
        secondary: Color(0xFF14B8A6), // Teal
        onSecondary: Color(0xFF0F172A),
        secondaryContainer: Color(0xFF115E59), // Dark Teal
        onSecondaryContainer: Color(0xFFCCFBF1), // Light Teal
        surface: Color(0xFF1E293B), // Slate-800
        onSurface: Color(0xFFF1F5F9), // Light Slate-100
        error: Color(0xFFF87171), // Bright Crimson
        onError: Color(0xFF7F1D1D),
        errorContainer: Color(0xFF7F1D1D),
        onErrorContainer: Color(0xFFFEE2E2),
        outline: Color(0xFF475569), // Slate-600
      ),
      scaffoldBackgroundColor: const Color(0xFF0F172A), // Slate-900
      cardTheme: CardThemeData(
        color: const Color(0xFF1E293B),
        elevation: 2,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF1E293B),
        foregroundColor: Color(0xFFF1F5F9),
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xFFF1F5F9),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF0F172A),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF475569)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF334155)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF8B5CF6), width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFF87171)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFF87171), width: 2),
        ),
        labelStyle: const TextStyle(color: Color(0xFF94A3B8)),
        hintStyle: const TextStyle(color: Color(0xFF64748B)),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF1E293B),
        selectedItemColor: Color(0xFF8B5CF6),
        unselectedItemColor: Color(0xFF64748B),
        elevation: 8,
      ),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFF1F5F9)),
        titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFF1F5F9)),
        bodyLarge: TextStyle(fontSize: 16, color: Color(0xFFE2E8F0)),
        bodyMedium: TextStyle(fontSize: 14, color: Color(0xFF94A3B8)),
      ),
    );
  }
}
