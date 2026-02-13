import 'dart:ui';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/app_bar.dart';
import '../widgets/drawer.dart';
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
    final Size size = MediaQuery.of(context).size;
    final bool isMobile = size.width < 800;

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
            // --- Hero Section ---
            _buildHeroSection(context, isMobile),

            // --- Mission Statement (The "Simple Belief") ---
            _buildBeliefSection(context, isMobile),

            // --- Company History & Vision Grid ---
            _buildVisionGrid(context, isMobile),

            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context, bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        isMobile ? 24 : 60,
        200,
        isMobile ? 24 : 60,
        100,
      ),
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: const Alignment(0.8, -0.5),
          radius: 1.2,
          colors: [
            BalanceColors.ledgerPrimary.withOpacity(0.15),
            BalanceColors.backgroundDark,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ShaderMask(
            shaderCallback: (bounds) =>
                BalanceColors.ledgerGradient.createShader(bounds),
            child: Text(
              'About Balance Labs',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isMobile ? 42 : 72,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                letterSpacing: -1,
              ),
            ),
          ),
          const SizedBox(height: 32),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Text(
              'Balance Labs is a digital wellness company focused on helping people regain clarity, focus, and emotional balance in an increasingly distracted world.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isMobile ? 20 : 24,
                color: BalanceColors.textSecondary,
                height: 1.6,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBeliefSection(BuildContext context, bool isMobile) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 60,
        vertical: 80,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            padding: EdgeInsets.all(isMobile ? 32 : 60),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.03),
              borderRadius: BorderRadius.circular(40),
              border: Border.all(color: Colors.white.withOpacity(0.08)),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.mobile_friendly_outlined,
                  color: Colors.amberAccent,
                  size: 32,
                ),
                const SizedBox(height: 24),
                Text(
                  'Our products are built around a simple belief:\nwell-being isn’t about doing more, but about doing what matters with intention.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: isMobile ? 24 : 36,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w200,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVisionGrid(BuildContext context, bool isMobile) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 60,
        vertical: 40,
      ),
      child: Wrap(
        spacing: 32,
        runSpacing: 32,
        children: [
          _buildInfoCard(
            title: 'Founded in 2026',
            description:
                'Balance Labs builds thoughtfully designed, non-intrusive apps that encourage mindful reflection, attention restoration, and healthy daily rituals — without manipulation, pressure, or unnecessary complexity.',
            isMobile: isMobile,
            width: isMobile ? double.infinity : 0.45,
          ),
          _buildInfoCard(
            title: 'A Human Focus',
            description:
                'Starting with Balance: Life Ledger and expanding into focus and attention-restoration experiences, we create tools that are calm, human-centered, and grounded in real behavioral change — not hype or automation.',
            isMobile: isMobile,
            width: isMobile ? double.infinity : 0.45,
          ),
          _buildInfoCard(
            title: 'Designed to Slow Down',
            description:
                'We design for people who want to reconnect with themselves and build sustainable habits in a noisy digital world. No social feeds. No comparisons. Just you.',
            isMobile: isMobile,
            width: double.infinity,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required String description,
    required bool isMobile,
    required double width,
  }) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: width <= 1.0 ? (screenWidth - 120) * width : width,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: BalanceColors.surfaceDark.withOpacity(0.5),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: TextStyle(
              color: BalanceColors.textSecondary,
              fontSize: 18,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
