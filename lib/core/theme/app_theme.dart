import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class AppTheme {
  static const background = Color(0xFF263238);
  static const accent = Color(0xFF4CAF50);
  static const surface = Color(0xFF37474F);
  static ThemeData get styleCarre => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: background,
    colorScheme: const ColorScheme.dark(surface: surface, primary: accent, secondary: accent),
    textTheme: GoogleFonts.abelTextTheme(ThemeData.dark().textTheme),
    appBarTheme: const AppBarTheme(backgroundColor: surface, elevation: 0),
    cardTheme: const CardThemeData(color: surface, elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
  );
}
