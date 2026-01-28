import 'package:flutter/material.dart';

class BalanceColors {
  // Balance: Life Ledger colors
  static const Color ledgerPrimary = Color(0xFF7C3AED); // Deep Purple
  static const Color ledgerSecondary = Color(0xFFA78BFA);
  static const Color ledgerAccent = Color(0xFFF59E0B);

  // Balance: Focus Restore colors
  static const Color focusPrimary = Color(0xFF2196F3); // Soft Blue
  static const Color focusSecondary = Color(0xFF4CAF50); // Gentle Green
  static const Color focusAccent = Color(0xFF03DAC6);

  // Website common colors
  static const Color backgroundDark = Color(0xFF0A0A0A);
  static const Color surfaceDark = Color(0xFF1A1A1A);
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFA0A0A0);
  static const Color divider = Color(0xFF2A2A2A);

  // Gradients
  static const Gradient ledgerGradient = LinearGradient(
    colors: [Color(0xFF7C3AED), Color(0xFFA78BFA)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient focusGradient = LinearGradient(
    colors: [Color(0xFF2196F3), Color(0xFF4CAF50)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient websiteGradient = LinearGradient(
    colors: [Color(0xFF0A0A0A), Color(0xFF1A1A1A), Color(0xFF2D2D2D)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
