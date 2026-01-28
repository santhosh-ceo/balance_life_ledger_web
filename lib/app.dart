import 'package:balance_web/web/constants/colors.dart';
import 'package:balance_web/web/pages/about_page.dart';
import 'package:balance_web/web/pages/contact_page.dart';
import 'package:balance_web/web/pages/home_page.dart';
import 'package:balance_web/web/pages/privacy_page.dart';
import 'package:balance_web/web/pages/product_page.dart';
import 'package:balance_web/web/pages/terms_page.dart';
import 'package:balance_web/web/pages/values_page.dart';
import 'package:flutter/material.dart';

class BalanceWebsite extends StatelessWidget {
  const BalanceWebsite({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Balance - Digital Wellness',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: BalanceColors.backgroundDark,
        colorScheme: const ColorScheme.dark(
          primary: BalanceColors.ledgerPrimary,
          secondary: BalanceColors.focusPrimary,
          surface: BalanceColors.surfaceDark,
          background: BalanceColors.backgroundDark,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.w900,
            letterSpacing: -2,
            height: 1.1,
          ),
          displayMedium: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w800,
            letterSpacing: -1,
            height: 1.2,
          ),
          displaySmall: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.5,
          ),
          headlineMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
          bodyLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            height: 1.6,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.5,
          ),
        ),
        cardTheme: CardThemeData(
          color: BalanceColors.surfaceDark,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: BorderSide(
              color: Colors.white.withOpacity(0.1),
              width: 1,
            ),
          ),
        ),
        buttonTheme: const ButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
      ),
      home: const HomePage(),
      routes: {
        '/home': (context) => const HomePage(),
        '/about': (context) => const AboutPage(),
        '/products': (context) => const ProductsPage(),
        '/values': (context) => const ValuesPage(),
        '/contact': (context) => const ContactPage(),
        '/terms': (context) => const TermsPage(),
        '/privacy': (context) => const PrivacyPage(),
      },
    );
  }
}