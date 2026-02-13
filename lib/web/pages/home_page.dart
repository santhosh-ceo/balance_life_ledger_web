import 'dart:ui';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/app_bar.dart';
import '../widgets/drawer.dart';
import '../widgets/footer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _navigateTo(int index) {
    setState(() => _currentIndex = index);
    final routes = ['/home', '/products', '/values', '/about', '/contact'];
    if (index < routes.length) Navigator.pushNamed(context, routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 900;

    return Scaffold(
      backgroundColor: BalanceColors.backgroundDark,
      extendBodyBehindAppBar: true,
      appBar: BalanceAppBar(
        isTransparent: true,
        currentIndex: _currentIndex,
        onItemTapped: _navigateTo,
      ),
      endDrawer: BalanceDrawer(
        currentIndex: _currentIndex,
        onNavigate: _navigateTo,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildLabsHero(isMobile),

            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 60,
                horizontal: isMobile ? 24 : 80,
              ),
              child: Column(
                children: [
                  const Text(
                    "Our Ecosystem",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 42,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -1,
                    ),
                  ),
                  const SizedBox(height: 100),

                  // 1. WEALTH TRACKER
                  _buildUIShowcaseRow(
                    isMobile: isMobile,
                    logo: 'assets/wealth_logo.png',
                    title: 'Wealth Tracker',
                    desc:
                        'A high-precision financial dashboard tracking 10 pillars: Food, Rent, Fuel, EMI, Bills, Shopping, Health, Entertainment, Transport, and Other. Smart-clutter removal hides categories with \$0 spending for a focused legend.',
                    image: 'assets/wealth_ui.png',
                    accentColor: const Color(0xFF10B981),
                    isReversed: false,
                  ),

                  const SizedBox(height: 150),

                  // 2. LIFE LEDGER
                  _buildUIShowcaseRow(
                    isMobile: isMobile,
                    logo: 'assets/ledger_logo.png',
                    title: 'Life Ledger',
                    desc:
                        'Your digital sanctuary for daily reflection. Securely log your moods, record your thoughts, and build a searchable history of your emotional journey with end-to-end encryption.',
                    image: 'assets/ledger_ui.png',
                    accentColor: BalanceColors.ledgerPrimary,
                    isReversed: true,
                  ),

                  const SizedBox(height: 150),

                  // 3. FOCUS RESTORE
                  _buildUIShowcaseRow(
                    isMobile: isMobile,
                    logo: 'assets/focus_logo.png',
                    title: 'Focus Restore',
                    desc:
                        'Reclaim your attention span. A specialized productivity suite that utilizes deep-work timers and session analytics to master focus in an age of distraction.',
                    image: 'assets/focus_ui.png',
                    accentColor: BalanceColors.focusPrimary,
                    isReversed: false,
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

  Widget _buildLabsHero(bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: isMobile ? 120 : 200, bottom: 100),
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: const Alignment(0.8, -0.6),
          radius: 1.5,
          colors: [
            BalanceColors.ledgerPrimary.withOpacity(0.08),
            Colors.transparent,
          ],
        ),
      ),
      child: Column(
        children: [
          Image.asset('assets/logo.png', height: 80),
          const SizedBox(height: 32),
          Text(
            'Balance Labs Inc.',
            style: TextStyle(
              fontSize: isMobile ? 48 : 88,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: -3,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Architecting tools for the intentional life.',
            style: TextStyle(
              color: Colors.white38,
              fontSize: 22,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUIShowcaseRow({
    required bool isMobile,
    required String logo,
    required String title,
    required String desc,
    required String image,
    required Color accentColor,
    required bool isReversed,
  }) {
    Widget textContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(logo, height: 50),
        const SizedBox(height: 24),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          desc,
          style: const TextStyle(
            color: BalanceColors.textSecondary,
            fontSize: 18,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 32),
        _AppFeatureBadge(text: "App Brief", color: accentColor),
      ],
    );

    // THE UI SHOWCASE WRAPPER (Device Mockup Style)
    Widget uiContent = Center(
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 340,
          maxHeight: 680,
        ), // Mobile Screen Ratio
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40), // Phone-like rounded corners
          border: Border.all(color: Colors.white.withOpacity(0.1), width: 8),
          boxShadow: [
            BoxShadow(
              color: accentColor.withOpacity(0.2),
              blurRadius: 100,
              spreadRadius: -20,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: Image.asset(image, fit: BoxFit.cover),
        ),
      ),
    );

    if (isMobile) {
      return Column(
        children: [uiContent, const SizedBox(height: 60), textContent],
      );
    }

    return Row(
      children: [
        if (isReversed) Expanded(child: uiContent),
        if (isReversed) const SizedBox(width: 100),
        Expanded(child: textContent),
        if (!isReversed) const SizedBox(width: 100),
        if (!isReversed) Expanded(child: uiContent),
      ],
    );
  }
}

class _AppFeatureBadge extends StatelessWidget {
  final String text;
  final Color color;
  const _AppFeatureBadge({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 12,
          letterSpacing: 1,
        ),
      ),
    );
  }
}
