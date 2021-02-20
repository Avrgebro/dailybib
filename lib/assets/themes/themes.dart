import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
  accentColor: const Color(0xFFED4B40),
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
  fontFamily: GoogleFonts.ubuntu().fontFamily
);

final lightTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  backgroundColor: const Color(0xFFE5E5E5),
  accentColor: const Color(0xFF00C9DB),
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
  fontFamily: GoogleFonts.ubuntu().fontFamily
);

final pinkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  backgroundColor: const Color(0xFFE5E5E5),
  accentColor: const Color(0xFFEB8AB7),
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
  fontFamily: GoogleFonts.ubuntu().fontFamily
);