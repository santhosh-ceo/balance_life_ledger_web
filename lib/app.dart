import 'package:balance_web/web/constants/colors.dart';
import 'package:balance_web/web/pages/features_page.dart';
import 'package:balance_web/web/pages/home_page.dart';
import 'package:balance_web/web/pages/privacy_page.dart';
import 'package:balance_web/web/pages/terms_page.dart';
import 'package:flutter/material.dart';

class BalanceWebsite extends StatelessWidget {
  const BalanceWebsite({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Balance: Life Ledger',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        colorScheme: ColorScheme.light(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          background: AppColors.background,
        ),
        fontFamily: 'Inter',
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/features': (context) => const FeaturesPage(),
        '/privacy': (context) => const PrivacyPage(),
        '/terms': (context) => const TermsPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
