import 'package:flutter/material.dart';

class AppColors {
  // Solid Colors
  static const Color primaryColor = Color(0xFF6200EE);
  static const Color secondaryColor = Color(0xFF03DAC6);
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color accentColor = Color(0xFFBB86FC);
  static const Color textColor = Color(0xFF000000);
  static const Color errorColor = Color(0xFFB00020);

  // Gradient Colors
  static const Gradient primaryGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 78, 9, 215),
      Color.fromARGB(255, 4, 32, 77),
      Color(0xff05275e),
      Color.fromARGB(255, 2, 21, 52),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient secondaryGradient = LinearGradient(
    colors: [Color(0xFFBB86FC), Color(0xFF6200EE)],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );
}
