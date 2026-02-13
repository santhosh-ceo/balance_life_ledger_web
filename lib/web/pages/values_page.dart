import 'dart:ui';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/app_bar.dart';
import '../widgets/drawer.dart';
import '../widgets/footer.dart';

class ValuesPage extends StatefulWidget {
  const ValuesPage({super.key});

  @override
  State<ValuesPage> createState() => _ValuesPageState();
}

class _ValuesPageState extends State<ValuesPage> {
  int _currentIndex = 2;

  void _navigateTo(int index) {
    setState(() => _currentIndex = index);
    final routes = ['/home', '/products', '/values', '/about', '/contact'];
    if (index < routes.length) Navigator.pushNamed(context, routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 800;

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
            // --- MANIFESTO HERO ---
            _buildManifestoHero(isMobile),

            // --- GLOBAL IMPACT SECTION ---
            _buildImpactSection(isMobile),

            // --- LEGAL & PRIVACY VAULT ---
            _buildPrivacyVault(isMobile),

            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildManifestoHero(bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(24, isMobile ? 120 : 200, 24, 100),
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: const Alignment(-0.6, -0.5),
          radius: 1.0,
          colors: [
            BalanceColors.focusPrimary.withOpacity(0.08),
            Colors.transparent,
          ],
        ),
      ),
      child: Column(
        children: [
          Text(
            "The Mindful Tech Manifesto",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 40 : 72,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 32),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Text(
              "At Balance Labs, we believe that technology should be a quiet servant, not a loud master. Our values are etched into every line of code, ensuring that your digital experience nourishes your well-being.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isMobile ? 18 : 22,
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

  Widget _buildImpactSection(bool isMobile) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 80,
        horizontal: isMobile ? 24 : 60,
      ),
      child: Column(
        children: [
          const Text(
            "Our Commitment in Motion",
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 60),
          Wrap(
            spacing: 32,
            runSpacing: 32,
            alignment: WrapAlignment.center,
            children: [
              _ValueCard(
                icon: Icons.public_rounded,
                title: 'Global Spread',
                description:
                    'Designed for a global audience, breaking language barriers to bring mindfulness to every corner of the world.',
                color: const Color(0xFF6366F1),
              ),
              _ValueCard(
                icon: Icons.favorite_rounded,
                title: 'Human-First',
                description:
                    'No addictive loops. No infinite scrolls. We measure success by the quality of your time, not the quantity.',
                color: Colors.pinkAccent,
              ),
              _ValueCard(
                icon: Icons.auto_awesome_rounded,
                title: 'Pure Intention',
                description:
                    'Every feature is built to solve a human problem, from financial clarity to attention restoration.',
                color: Colors.amberAccent,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPrivacyVault(bool isMobile) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 100,
        horizontal: isMobile ? 24 : 80,
      ),
      padding: EdgeInsets.all(isMobile ? 32 : 60),
      decoration: BoxDecoration(
        color: BalanceColors.surfaceDark.withOpacity(0.3),
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        children: [
          const Icon(Icons.shield_rounded, color: Colors.greenAccent, size: 48),
          const SizedBox(height: 24),
          const Text(
            "Privacy & Security Vault",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Your data is yours. We are just the stewards.",
            style: TextStyle(color: Colors.white60, fontSize: 18),
          ),
          const SizedBox(height: 60),
          Wrap(
            spacing: 40,
            runSpacing: 40,
            alignment: WrapAlignment.center,
            children: [
              _VaultItem(
                icon: Icons.lock_outline,
                text: "End-to-End Encryption",
              ),
              _VaultItem(
                icon: Icons.no_accounts_outlined,
                text: "Zero Third-Party Selling",
              ),
              _VaultItem(
                icon: Icons.gpp_maybe_outlined,
                text: "GDPR & CCPA Compliant",
              ),
              _VaultItem(
                icon: Icons.delete_forever_outlined,
                text: "Instant Data Deletion",
              ),
            ],
          ),
          const SizedBox(height: 80),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _LegalButton(label: "Privacy Policy", onTap: () {}),
              const SizedBox(width: 20),
              _LegalButton(label: "Terms of Service", onTap: () {}),
            ],
          ),
        ],
      ),
    );
  }
}

class _ValueCard extends StatelessWidget {
  final IconData icon;
  final String title, description;
  final Color color;

  const _ValueCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.02),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 40),
          const SizedBox(height: 24),
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
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: BalanceColors.textSecondary,
              fontSize: 16,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _VaultItem extends StatelessWidget {
  final IconData icon;
  final String text;
  const _VaultItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white38, size: 32),
        const SizedBox(height: 12),
        Text(text, style: const TextStyle(color: Colors.white70, fontSize: 14)),
      ],
    );
  }
}

class _LegalButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _LegalButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.white10),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Text(label, style: const TextStyle(color: Colors.white70)),
    );
  }
}
