import 'package:flutter/material.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 26,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: 20,
      color: Colors.black87,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 16,
      color: Colors.black87,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 14,
      color: Colors.black87,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 14,
      color: Colors.black,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 14,
      color: Colors.black,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 14,
      color: Colors.black,
    ),
    labelLarge: const TextStyle().copyWith(
      fontSize: 12,
      color: Colors.black,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 12,
      color: Colors.black,
    ),
  );

  static TextTheme darkTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 26,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: 20,
      color: Colors.white,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 16,
      color: Colors.white,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 16,
      color: Colors.white,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 14,
      color: Colors.white,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 14,
      color: Colors.white,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 14,
      color: Colors.white,
    ),
    labelLarge: const TextStyle().copyWith(
      fontSize: 12,
      color: Colors.white,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 12,
      color: Colors.white,
    ),
  );
}
