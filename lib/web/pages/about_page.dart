// pages/about_page.dart
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../widgets/app_bar.dart';
import '../widgets/footer.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  int _currentIndex = 3;

  void _navigateTo(int index) {
    setState(() {
      _currentIndex = index;
    });
    final routes = ['/home', '/products', '/values', '/about', '/contact'];
    if (index < routes.length) {
      Navigator.pushNamed(context, routes[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BalanceAppBar(
        currentIndex: _currentIndex,
        onItemTapped: _navigateTo,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 120,
                horizontal: 32,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    BalanceColors.backgroundDark,
                    BalanceColors.surfaceDark,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'About Balance',
                    style: Theme.of(
                      context,
                    ).textTheme.displayMedium?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'We believe technology should serve human well-being, not distract from it.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: BalanceColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
