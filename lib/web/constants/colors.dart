import 'package:flutter/material.dart';

class BalanceColors {
  // --- Global Website Foundation ---
  // Deep Midnight/Ebony base from the "Focus Restore" background
  static const Color backgroundDark = Color(0xFF0F141E);
  static const Color surfaceDark = Color(0xFF1B2230); // Lighter card surface
  static const Color textPrimary = Color(0xFFF8FAFC);
  static const Color textSecondary = Color(0xFF94A3B8);
  static const Color divider = Color(0xFF2D3748);

  // --- Balance: Life Ledger (The Purple/Lavender Vibe) ---
  static const Color ledgerPrimary = Color(0xFF4A1D96); // Rich Deep Purple
  static const Color ledgerSecondary = Color(0xFFC084FC); // Bright Lavender
  static const Color ledgerAccent = Color(0xFFF472B6); // Pinkish Highlight

  // --- Balance: Focus Restore (The Dark Navy/Cyan Vibe) ---
  static const Color focusPrimary = Color(0xFF0EA5E9); // Electric Sky Blue
  static const Color focusSecondary = Color(0xFF2DD4BF); // Mint/Cyan
  static const Color focusAccent = Color(
    0xFFFBBF24,
  ); // Warm Amber (for XP/Stars)

  // --- Wealth Tracker (Consistency with your previous request) ---
  static const Color wealthPrimary = Color(0xFF10B981); // Success Green
  static const Color wealthSurface = Color(0xFF1E293B);

  // --- Gradients (Updated for Glassmorphism & Depth) ---

  // As seen in the "Daily Momentum" card
  static const Gradient ledgerGradient = LinearGradient(
    colors: [Color(0xFF6366F1), Color(0xFF4338CA)], // Indigo to Deep Purple
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // As seen in the "Challenges" active buttons
  static const Gradient focusGradient = LinearGradient(
    colors: [Color(0xFF0369A1), Color(0xFF0EA5E9)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Website Hero/Background Gradient
  static const Gradient websiteGradient = LinearGradient(
    colors: [
      Color(0xFF0F172A), // Slate 900
      Color(0xFF1E1B4B), // Deep Indigo
      Color(0xFF020617), // Real Black
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
