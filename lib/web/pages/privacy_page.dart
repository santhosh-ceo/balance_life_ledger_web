import 'dart:ui';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/app_bar.dart';
import '../widgets/footer.dart';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({super.key});

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
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
            // --- PREMIUM HERO ---
            _buildHero(isMobile),

            // --- PRIVACY SCORECARD (The "Cool" Summary) ---
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
                    _PrivacyCard(
                      number: "01",
                      title: 'The Blueprint',
                      content:
                          'Balance Digital Wellness ("we", "our", or "us") is built on the foundation of trust. This policy governs our suite: Life Ledger, Focus Restore, and Wealth Tracker. We don’t just comply with privacy; we design for it.',
                    ),
                    const SizedBox(height: 32),
                    _PrivacyCard(
                      number: "02",
                      title: 'Wealth & Personal Data',
                      content:
                          'For the Wealth Tracker, all category data (Food, Rent, Fuel, etc.) is processed with strict encryption. We collect your email for sync and profile metadata to personalize your reflection journey. We never see your specific journal thoughts; they belong to you.',
                    ),
                    const SizedBox(height: 32),
                    _PrivacyCard(
                      number: "03",
                      title: 'The Tech Stack',
                      content:
                          'We utilize Google Firebase for high-grade security. This includes Firebase Auth for your identity, Cloud Firestore for encrypted storage, and Crashlytics to ensure your experience never falters. Your data is encrypted at rest and in transit.',
                    ),
                    const SizedBox(height: 32),
                    _PrivacyCard(
                      number: "04",
                      title: 'Your Sovereignty',
                      content:
                          'You have the right to export your data, correct it, or initiate a "Full Wipe." Deleting your account removes all personal identifiers and journal entries from our active servers within 30 days.',
                    ),
                    const SizedBox(height: 80),
                    _buildContactFooter(),
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
          center: const Alignment(0.8, -0.5),
          radius: 1.2,
          colors: [
            BalanceColors.ledgerPrimary.withOpacity(0.1),
            Colors.transparent,
          ],
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.greenAccent.withOpacity(0.1),
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.greenAccent.withOpacity(0.2)),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.verified_user_rounded,
                  color: Colors.greenAccent,
                  size: 14,
                ),
                SizedBox(width: 8),
                Text(
                  "ENCRYPTED & SECURE",
                  style: TextStyle(
                    color: Colors.greenAccent,
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
            "Privacy Protocol",
            style: TextStyle(
              fontSize: isMobile ? 42 : 72,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Last Updated: February 2026 • Version 2.0",
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
            icon: Icons.visibility_off_rounded,
            label: "Zero Data Selling",
          ),
          _ScoreItem(icon: Icons.lock_outline_rounded, label: "E2E Encryption"),
          _ScoreItem(
            icon: Icons.delete_forever_rounded,
            label: "Instant Deletion",
          ),
          _ScoreItem(
            icon: Icons.analytics_outlined,
            label: "Anonymous Analytics",
          ),
        ],
      ),
    );
  }

  Widget _buildContactFooter() {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            BalanceColors.ledgerPrimary.withOpacity(0.1),
            BalanceColors.focusPrimary.withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        children: [
          const Text(
            "Have Questions?",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "Our Data Protection Officer is ready to assist you.",
            style: TextStyle(color: BalanceColors.textSecondary),
          ),
          const SizedBox(height: 32),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.email_outlined, color: Colors.white),
            label: const Text(
              "info@anakramy.com",
              style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PrivacyCard extends StatelessWidget {
  final String number, title, content;
  const _PrivacyCard({
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
              color: BalanceColors.ledgerPrimary.withOpacity(0.5),
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
        Icon(icon, color: BalanceColors.ledgerPrimary, size: 32),
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
