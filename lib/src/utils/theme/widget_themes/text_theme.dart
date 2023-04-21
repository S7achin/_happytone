import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class STextTheme {
  STextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: GoogleFonts.montserrat(
        color: Colors.black, fontSize: 28.0, fontWeight: FontWeight.w700),
    headlineMedium: GoogleFonts.montserrat(
        color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.w700),
    headlineSmall: GoogleFonts.montserrat(
        color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w700),
    titleLarge: const TextStyle(
      color: Colors.black,
      fontSize: 20,
    ),
    titleMedium: const TextStyle(
      color: Colors.black,
      fontSize: 18,
    ),
    titleSmall: const TextStyle(
      color: Colors.black,
      fontSize: 16,
    ),
    labelMedium: const TextStyle(color: Colors.white, fontSize: 18.0),
    labelSmall: const TextStyle(
      color: Colors.white,
      fontSize: 16,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: GoogleFonts.montserrat(
        color: const Color.fromARGB(255, 226, 221, 221),
        fontSize: 28.0,
        fontWeight: FontWeight.w700),
    headlineMedium: GoogleFonts.montserrat(
        color: const Color.fromARGB(255, 226, 221, 221),
        fontSize: 24.0,
        fontWeight: FontWeight.w700),
    headlineSmall: GoogleFonts.montserrat(
        color: const Color.fromARGB(255, 225, 219, 219),
        fontSize: 20.0,
        fontWeight: FontWeight.w700),
    titleLarge: const TextStyle(
      color: Color.fromARGB(255, 238, 231, 231),
      fontSize: 20,
    ),
    titleMedium: const TextStyle(
      color: Color.fromARGB(255, 238, 231, 231),
      fontSize: 18,
    ),
    titleSmall: const TextStyle(
      color: Color.fromARGB(255, 238, 231, 231),
      fontSize: 16,
    ),
    bodyLarge: const TextStyle(color: Colors.white),
    bodyMedium: const TextStyle(color: Colors.white),
    bodySmall: const TextStyle(color: Colors.white),
    labelMedium: GoogleFonts.montserrat(
        color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w700),
    labelSmall: GoogleFonts.montserrat(
        color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.w700),
  );
}
