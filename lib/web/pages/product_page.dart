import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/colors.dart';
import '../widgets/app_bar.dart';
import '../widgets/drawer.dart';
import '../widgets/footer.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  int _currentIndex = 1;

  void _navigateTo(int index) {
    setState(() => _currentIndex = index);
    final routes = ['/home', '/products', '/values', '/about', '/contact'];
    if (index < routes.length) Navigator.pushNamed(context, routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 950;

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
            _buildPageHero(isMobile),

            // --- APP 1: LIFE LEDGER ---
            _AppShowcase(
              logo: "assets/ledger_logo.png",
              title: "Balance: Life Ledger",
              tagline: "Your Daily Ritual for Mindful Reflection",
              description:
                  "Understand the 'Why' behind your mood. A structured companion that turns daily snapshots into a visual narrative. Securely log your thoughts with end-to-end encryption and beautiful data visualizations.",
              gradient: BalanceColors.ledgerGradient,
              playStoreUrl:
                  "https://play.google.com/store/apps/details?id=com.anakramy.balance",
              screenshots: const [
                "assets/ledger_1.png",
                "assets/ledger_2.png",
                "assets/ledger_3.png",
                "assets/ledger_4.png",
              ],
              isMobile: isMobile,
            ),

            // --- APP 2: FOCUS RESTORE ---
            _AppShowcase(
              logo: "assets/focus_logo.png",
              title: "Balance: Focus Restore",
              tagline: "Reclaim Your Productivity through Science",
              description:
                  "Deep focus sessions and meaningful breaks designed to strengthen your attention span. Master focus in an age of distraction with advanced timers and session analytics.",
              gradient: BalanceColors.focusGradient,
              playStoreUrl:
                  "https://play.google.com/store/apps/details?id=com.anakramy.restore.balance_focus_restore",
              screenshots: const [
                "assets/focus_1.png",
                "assets/focus_2.png",
                "assets/focus_3.png",
                "assets/focus_4.png",
              ],
              isMobile: isMobile,
            ),

            // --- APP 3: WEALTH TRACKER ---
            _AppShowcase(
              logo: "assets/wealth_logo.png",
              title: "Balance: Wealth Tracker",
              tagline: "Precision Tracking & Financial Optimization",
              description:
                  "The 10-pillar financial engine. Track Food, Rent, Fuel, EMI, and more with an intelligent legend system. Features pure color accuracy and smart-clutter removal for zero-spending categories.",
              gradient: const LinearGradient(
                colors: [Color(0xFF10B981), Color(0xFF059669)],
              ),
              playStoreUrl:
                  "https://play.google.com/store/apps/details?id=com.anakramy.balance_wealth_tracker",
              screenshots: const [
                "assets/wealth_1.png",
                "assets/wealth_2.png",
                "assets/wealth_3.png",
                "assets/wealth_4.png",
              ],
              isMobile: isMobile,
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildPageHero(bool isMobile) {
    return Container(
      padding: EdgeInsets.fromLTRB(24, isMobile ? 120 : 200, 24, 60),
      child: Column(
        children: [
          Text(
            "Our suite of apps",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 42 : 80,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: -2,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Explore the Balance Labs ecosystem of digital wellness tools.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white38, fontSize: 18),
          ),
        ],
      ),
    );
  }
}

class _AppShowcase extends StatelessWidget {
  final String logo, title, tagline, description, playStoreUrl;
  final List<String> screenshots;
  final Gradient gradient;
  final bool isMobile;

  const _AppShowcase({
    required this.logo,
    required this.title,
    required this.tagline,
    required this.description,
    required this.playStoreUrl,
    required this.screenshots,
    required this.gradient,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 100,
        horizontal: isMobile ? 24 : 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // Centered Layout
        children: [
          // Logo above title
          Image.asset(logo, height: 80),
          const SizedBox(height: 24),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 48,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            tagline,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: gradient.colors.first,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 24),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: BalanceColors.textSecondary,
                fontSize: 18,
                height: 1.6,
              ),
            ),
          ),
          const SizedBox(height: 40),
          _DownloadPlayButton(url: playStoreUrl, gradient: gradient),
          const SizedBox(height: 80),

          // Screenshots below description
          isMobile ? _buildScreenshotGrid() : _buildScreenshotRow(),
        ],
      ),
    );
  }

  Widget _buildScreenshotRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: screenshots
          .map(
            (s) => Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: _GlassScreenshot(asset: s),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildScreenshotGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.55,
      ),
      itemCount: screenshots.length,
      itemBuilder: (context, index) =>
          _GlassScreenshot(asset: screenshots[index]),
    );
  }
}

class _GlassScreenshot extends StatelessWidget {
  final String asset;
  const _GlassScreenshot({required this.asset});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 40,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.asset(asset, fit: BoxFit.cover),
      ),
    );
  }
}

class _DownloadPlayButton extends StatelessWidget {
  final String url;
  final Gradient gradient;
  const _DownloadPlayButton({required this.url, required this.gradient});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async => await launchUrl(Uri.parse(url)),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                color: gradient.colors.first.withOpacity(0.3),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.play_arrow_rounded, color: Colors.white, size: 28),
              SizedBox(width: 12),
              Text(
                "GOOGLE PLAY",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
