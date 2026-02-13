import 'dart:ui';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/app_bar.dart';
import '../widgets/footer.dart';

class TermsPage extends StatefulWidget {
  const TermsPage({super.key});

  @override
  State<TermsPage> createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- PREMIUM HERO (Mirrors Privacy) ---
            _buildHero(isMobile),

            // --- TERMS SUMMARY SCORECARD ---
            _buildScorecard(isMobile),

            // --- MAIN CONTENT ---
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 80,
                vertical: 60,
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: Column(
                  children: [
                    _TermsCard(
                      number: "01",
                      title: 'Digital Agreement',
                      content:
                          'By accessing Balance: Life Ledger, Focus Restore, or Wealth Tracker, you enter into a binding agreement with Balance Digital Wellness. These terms govern your journey toward digital equilibrium.',
                    ),
                    const SizedBox(height: 32),
                    _TermsCard(
                      number: "02",
                      title: 'The Service Ecosystem',
                      content:
                          'We provide tools for reflection, focus, and wealth tracking. Note: The Wealth Tracker is a data visualization tool. We provide categories (Food, Rent, Fuel, etc.) for your organization, but we do not provide professional financial or investment advice.',
                    ),
                    const SizedBox(height: 32),
                    _TermsCard(
                      number: "03",
                      title: 'Subscriptions & Premium',
                      content:
                          'Premium features are processed via the Apple App Store or Google Play Store. Subscriptions auto-renew unless toggled off 24 hours before the period ends. We maintain a transparent "No Hidden Fees" policy.',
                    ),
                    const SizedBox(height: 32),
                    _TermsCard(
                      number: "04",
                      title: 'Usage Constraints',
                      content:
                          'You agree to use our services for personal growth. Reverse engineering our "Focus" algorithms or attempting to bypass our "Life Ledger" security measures is strictly prohibited and results in immediate account termination.',
                    ),
                    const SizedBox(height: 32),
                    _TermsCard(
                      number: "05",
                      title: 'Intellectual Property',
                      content:
                          'All code, design systems, and the "Balance" brand identity are the exclusive property of Balance Labs. Your journal entries and wealth data remain 100% yours; we only provide the canvas.',
                    ),
                    const SizedBox(height: 80),
                    _buildLegalFooter(),
                  ],
                ),
              ),
            ),
            const Footer(showLegalLinks: false),
          ],
        ),
      ),
    );
  }

  Widget _buildHero(bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(24, isMobile ? 120 : 180, 24, 60),
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: const Alignment(-0.8, -0.5),
          radius: 1.2,
          colors: [
            BalanceColors.focusPrimary.withOpacity(0.1),
            Colors.transparent,
          ],
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: BalanceColors.focusPrimary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: BalanceColors.focusPrimary.withOpacity(0.2),
              ),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.gavel_rounded,
                  color: BalanceColors.focusPrimary,
                  size: 14,
                ),
                SizedBox(width: 8),
                Text(
                  "USER AGREEMENT",
                  style: TextStyle(
                    color: BalanceColors.focusPrimary,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Text(
            "Terms of Service",
            style: TextStyle(
              fontSize: isMobile ? 42 : 72,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Effective Date: February 2026 • Bengaluru, India",
            style: TextStyle(color: Colors.white38, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildScorecard(bool isMobile) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 80),
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: BalanceColors.surfaceDark.withOpacity(0.5),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Wrap(
        spacing: 40,
        runSpacing: 32,
        alignment: WrapAlignment.center,
        children: [
          _ScoreItem(
            icon: Icons.account_balance_wallet_outlined,
            label: "Not Financial Advice",
          ),
          _ScoreItem(icon: Icons.refresh_rounded, label: "Auto-Renewable"),
          _ScoreItem(
            icon: Icons.assignment_ind_outlined,
            label: "Personal Use Only",
          ),
          _ScoreItem(
            icon: Icons.copyright_rounded,
            label: "All Rights Reserved",
          ),
        ],
      ),
    );
  }

  Widget _buildLegalFooter() {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.02),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.info_outline, color: BalanceColors.focusPrimary),
          const SizedBox(width: 16),
          Flexible(
            child: Text(
              "Questions about our legal framework? Reach out to legal@balancedigitalwellness.com",
              style: TextStyle(
                color: BalanceColors.textSecondary,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TermsCard extends StatelessWidget {
  final String number, title, content;
  const _TermsCard({
    required this.number,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.02),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            number,
            style: TextStyle(
              color: BalanceColors.focusPrimary.withOpacity(0.5),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Courier',
            ),
          ),
          const SizedBox(width: 32),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  content,
                  style: TextStyle(
                    color: BalanceColors.textSecondary,
                    fontSize: 17,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ScoreItem extends StatelessWidget {
  final IconData icon;
  final String label;
  const _ScoreItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: BalanceColors.focusPrimary, size: 32),
        const SizedBox(height: 12),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
